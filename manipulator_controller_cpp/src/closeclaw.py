#!/usr/bin/env python3
import rospy
from custom_msg.msg import set_angles

if __name__ == '__main__':
    rospy.init_node('closeclaw', anonymous=True)
    msg_setAngle = set_angles()
    pub_setAngle = rospy.Publisher('/cmd_3R', set_angles, queue_size=1)
    msg_setAngle.set_GAR = 1.0
    msg_setAngle.set_Kp_GAR = 0.3
    msg_setAngle.set_GAR = 100
    rospy.sleep(1)
    pub_setAngle.publish(msg_setAngle)
    # msg_setAngle.retry = True
    # msg_setAngle.reset = True
    # for i in range(120, 180):
        # rospy.sleep(0.01)
        # msg_setAngle.set_GAR = i
        # pub_setAngle.publish(msg_setAngle)