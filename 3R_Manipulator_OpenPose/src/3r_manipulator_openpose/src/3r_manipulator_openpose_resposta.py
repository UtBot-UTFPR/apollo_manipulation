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
import sys
import json


mqttc = mqtt.Client()
pub_cmd = rospy.Publisher("/cmd_3R",set_angles,queue_size=10)
msg_cmd = set_angles()


def on_message_msgs(mosq, obj, msg):
    
    m_decode=str(msg.payload.decode("utf-8","ignore"))
    data=json.loads(m_decode)
    msg_cmd.reset = data["reset"]
    msg_cmd.retry = data["retry"]
    msg_cmd.emergency_stop = data["emergency_stop"]
    msg_cmd.set_OMB = data["set_OMB"]
    msg_cmd.set_COT = data["set_COT"]
    msg_cmd.set_PUN = data["set_PUN"]
    pub_cmd.publish(msg_cmd)


def conecta():
	global mqttc
	mqttc = mqtt.Client()
	mqttc.connect("142.93.58.237", 3000)
	mqttc.message_callback_add("/cmd_3R_mqtt", on_message_msgs)  
	
	print("Conectado!")

if __name__ == '__main__':
    rospy.init_node('recebeUSBCAM',anonymous=True)
    conecta()
    rate = rospy.Rate(10)
    mqttc.subscribe("/cmd_3R_mqtt", 0)
    mqttc.loop_start()
    while not rospy.is_shutdown():
		rate.sleep()

