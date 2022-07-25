#! /usr/bin/python3

from geometry_msgs.msg import Point
from custom_msg.msg import set_angles
import math

length_OMB = 23.5
length_COT = 24.5
length_PUN = 6.5
correction_OMB = 0.0
correction_COT = 0.0
correction_PUN = 10.0

goal = Point(39.101, 32.968, 0.0)
msg_set_angles = set_angles()

def inverseKinematicsQuaternion():
    offsetGoal = Point(goal.x - length_PUN, goal.y, goal.z)
    o = length_OMB
    c = length_COT
    v = math.sqrt(pow(offsetGoal.x, 2) + pow(offsetGoal.y, 2))
    delta = math.asin(offsetGoal.y/v)
    alpha = math.acos((pow(v,2)+pow(o,2)-pow(c,2))/(2*v*o))
    beta = math.acos((pow(o,2)+pow(c,2)-pow(v,2))/(2*c*o))
    cos_gamma = math.cos((delta-alpha)/2)

if __name__ == "__main__":
    inverseKinematicsQuaternion()