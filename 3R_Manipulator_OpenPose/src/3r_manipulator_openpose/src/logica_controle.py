#!/usr/bin/env python

import rospy

from  openpose_ros_msgs.msg import OpenPoseHumanList
import numpy as np
import matplotlib.pyplot as plt
import math	
from geometry_msgs.msg import Twist
from custom_msg.msg import set_angles,status_arm

global maoEsquerda, maoDireita, cmd_3R, msg;

msg = set_angles()
cmd_3R = rospy.Publisher('/cmd_3R', set_angles, queue_size=10);
anguloOMG = 0
anguloCOT = 0
def getTopicoData():
	global maoEsquerda, maoDireita;
	maoEsquerda = []
	maoDireita = []

	msg = rospy.wait_for_message("/openpose_ros/human_list", OpenPoseHumanList)
	if (msg.human_list):
		if (msg.human_list[0].num_left_hand_key_points_with_non_zero_prob != 0):
			for i in range(0,len(msg.human_list[0].left_hand_key_points_with_prob)):
				maoEsquerda.append(msg.human_list[0].left_hand_key_points_with_prob[i])
		
		if (msg.human_list[0].num_right_hand_key_points_with_non_zero_prob != 0):
			for i in range(0,len(msg.human_list[0].right_hand_key_points_with_prob)):
				maoDireita.append(msg.human_list[0].right_hand_key_points_with_prob[i])
	


def calculaDifAngular(dados):
	#Calcula a diferenca angular
	difAngular = math.atan2(dados[1][0]-dados[0][0], dados[1][1]-dados[0][1])
	difAngular = abs(math.degrees(difAngular))
	#print difAngular
	return (difAngular)


def controleVelocidade():
	global maoEsquerda, maoDireita, msg, cmd_3R;
	global anguloOMG 
	global anguloCOT 
        
	if (len(maoEsquerda)>0):
        	if (maoEsquerda[5].prob > 0.4): 
			angle = calculaDifAngular([[maoEsquerda[5].x, maoEsquerda[5].y],[maoEsquerda[8].x, maoEsquerda[8].y]])
			if (angle>=95):
				anguloOMG = anguloOMG + 1
			elif(angle < 85):
				anguloOMG = anguloOMG - 1
		else:
        		anguloOMG = anguloOMG
	else:
        	anguloOMG = anguloOMG
	if (len(maoDireita)>0):
		if (maoDireita[5].prob > 0.4): 
			angle = calculaDifAngular([[maoDireita[5].x, maoDireita[5].y],[maoDireita[8].x, maoDireita[8].y]])
			if (angle>=95):
				anguloCOT = anguloCOT + 1
			elif(angle < 85):
				anguloCOT = anguloCOT -1
		else:
        		anguloCOT = anguloCOT
	else:
        	anguloCOT = anguloCOT		
	maoEsquerda = []
	maoDireita = []

	msg.set_OMB = anguloOMG	
	msg.set_COT  = anguloCOT
	cmd_3R.publish(msg)

		

def paradeDeEmergencia():
	global maoEsquerda, maoDireita, cmd_3R, msg;
	if (len(maoEsquerda)>0):
		if (calculaDifAngular([[maoEsquerda[3].x, maoEsquerda[3].y],[maoEsquerda[4].x, maoEsquerda[4].y]])>= 90):
			if (calculaDifAngular([[maoEsquerda[10].x, maoEsquerda[10].y],[maoEsquerda[12].x, maoEsquerda[12].y]]) >= 90):
				if (calculaDifAngular([[maoEsquerda[14].x, maoEsquerda[14].y],[maoEsquerda[16].x, maoEsquerda[16].y]]) >= 100):
					if (calculaDifAngular([[maoEsquerda[18].x, maoEsquerda[18].y],[maoEsquerda[20].x, maoEsquerda[20].y]]) >= 100):
						msg.set_OMB = anguloOMG	
						msg.set_OMB = anguloOMG
						cmd_3R.publish(msg)
						print("parada de emergencia")
						return True;
	
	return False

def plotDados():
	global maoEsquerda, maoDireita;
	x = []
	y = []
	x2 = []
	y2 = []
	if (len(maoEsquerda)>0):
		print(maoEsquerda[0].x)
		for i in range(0,20):
			x.append(maoEsquerda[i].x)
			y.append(maoEsquerda[i].y)
			x2.append(maoEsquerda[i].x - maoEsquerda[0].x)
			y2.append(maoEsquerda[i].y - maoEsquerda[0].y)
		x = [x2[6],x2[8]]
		y = [y2[6],y2[8]]
		calculaDifAngular(x,y)
		#plt.scatter(x, y)
		#plt.show()

def init():
	while not rospy.is_shutdown():
		getTopicoData()
		if (paradeDeEmergencia() == False):
			controleVelocidade()
		

if __name__=="__main__":
    rospy.init_node("comandosPorGestos")
    init();
    rospy.spin()

