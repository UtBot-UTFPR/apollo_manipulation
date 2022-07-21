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
	ros::init(argc, argv, "hand_setpoint_publisher_node");
	ros::NodeHandle n;

	// VARIÁVEIS DE TEMPO
	ros::Rate loopRate(30);

	// PUBLISHERS
	ros::Publisher pub_setPoint	= n.advertise<geometry_msgs::Point>("/arm_setpoint", 0);

	char key = '0';

	puts("\n");
	ROS_INFO("press [SPACE] to set new goal point\n");
	
	// LOOP PRINCIPAL
	while (ros::ok()) {
		loopRate.sleep();
		ros::spinOnce();
		if (kbhit()) {
			key = getchar();
			if (key == ' ') {
				ROS_INFO("Setting new goal point");
				float x, y;
				printf(" - [x] [y]: ");
				scanf("%f %f", &x, &y);
				msg_setPoint.x = x;
				msg_setPoint.y = y;
				pub_setPoint.publish(msg_setPoint);
			}
		}
	}
	return 0;
}