#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
import os
import cv2
import numpy
from cv_bridge import CvBridge
from std_msgs.msg import String
from custom_msg.msg import set_angles,status_arm
import paho.mqtt.client as mqtt
import json


mqttc = mqtt.Client()

def conecta():
	global mqttc
	mqttc = mqtt.Client()
	mqttc.connect("142.93.58.237", 3000)
	mqttc.loop_start()	
	print("Conectado!")

def callback(data):
    cmd_3r = {
        "reset": data.reset,
        "retry": data.retry,
        "emergency_stop": data.emergency_stop,
        "set_OMB": data.set_OMB,
        "set_COT": data.set_COT,
        "set_PUN": data.set_PUN
    }
    
    data_out=json.dumps(cmd_3r)
    #print(data_out)
    #stringData = teste.tostring()
    
    mqttc.publish("/cmd_3R_mqtt", data_out,  qos=1)

if __name__ == '__main__':
    rospy.init_node('enviaUSBCAM',anonymous=True)
    conecta()
    rate = rospy.Rate(10)
    while not rospy.is_shutdown():
        msg =rospy.wait_for_message("/cmd_3R",set_angles)
        cmd_3r = {
        "reset": msg.reset,
        "retry": msg.retry,
        "emergency_stop": msg.emergency_stop,
        "set_OMB": msg.set_OMB,
        "set_COT": msg.set_COT,
        "set_PUN": msg.set_PUN
        }
    
        data_out=json.dumps(cmd_3r)
    #print(data_out)
    #stringData = teste.tostring()
    
        mqttc.publish("/cmd_3R_mqtt", data_out,  qos=1)
        rate.sleep()