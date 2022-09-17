#include <stdio.h>
#include <ros/ros.h>
#include <geometry_msgs/Point.h>
#include "__kbhit.h"

// *** MENSAGENS PUBLICADAS ***
geometry_msgs::Point msg_setPoint;

// *** MAIN ***
int main(int argc, char **argv)
{
	// INICIALIZAÇÃO DO NODO
	ros::init(argc, argv, "setpoint_publisher_node");
	ros::NodeHandle n;

	// VARIÁVEIS DE TEMPO
	ros::Rate loopRate(30);

	// PUBLISHERS
	ros::Publisher pub_setPoint	= n.advertise<geometry_msgs::Point>("/arm_setpoint", 0);

	char key = '0';
	msg_setPoint.x = 0;
	msg_setPoint.y = 0;
	msg_setPoint.z = 0;

	puts("\n");
	ROS_INFO("press [P] to set new goal point\n");
	
	// LOOP PRINCIPAL
	while (ros::ok()) {
		loopRate.sleep();
		ros::spinOnce();
		if (kbhit()) {
			key = getchar();
			if (key == 'P' || key == 'p') {
				ROS_INFO("Type [x] [y] [z]:");
				float x, y, z;
				scanf("%f %f %f", &x, &y, &z);
				msg_setPoint.x = x;
				msg_setPoint.y = y;
				msg_setPoint.z = z;
				pub_setPoint.publish(msg_setPoint);
			}
		}
	}
	return 0;
}