#include <stdio.h>
#include <ros/ros.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>
#include <custom_msg/status_arm.h>
#include <custom_msg/set_angles.h>
#include "3r_kinematics.hpp"

// set_GAR: 120 ou 180

// MENSAGENS RECEBIDAS
geometry_msgs::Point 	msg_setPoint;

// MENSAGENS PUBLICADAS
custom_msg::set_angles  msg_set_angles;

// FUNÇÕES
void callback_setPoint(const geometry_msgs::Point::ConstPtr& msg);

// FUNÇÃO MAIN
int main(int argc, char **argv)
{
	// INICIALIZAÇÃO DO NODO
	ros::init(argc, argv, "hand_setpoint_node");
	ros::NodeHandle n;	
	
	// SUBSCRIBERS
	ros::Subscriber sub_setPoint	= n.subscribe("/arm/setpoint", 1, callback_setPoint);
	
	// PUBLISHERS
	ros::Publisher pub_set_angles 	= n.advertise<custom_msg::set_angles>("/cmd_3R", 0);

	// VARIÁVEIS DE TEMPO
	ros::Rate loopRate(30);

	const float length_OMB = 23.5;
    const float length_COT = 24.5;
	const float length_PUN = 6.5;

	// PONTO DESTINO
	geometry_msgs::Point goal;
	goal.x = 48;
	goal.y = 0;
	
	// LOOP PRINCIPAL
	while (ros::ok()) {
		loopRate.sleep();
		ros::spinOnce();
		inverseKinematics(&goal, &msg_set_angles, 
			length_OMB, length_COT, length_PUN,
			0, 0, 10);
		// forwardKinematics(&goal, &msg_set_angles, length_OMB, length_COT, length_PUN);
		pub_set_angles.publish(msg_set_angles);
	}
	
	return 0;
}

void callback_setPoint(const geometry_msgs::Point::ConstPtr& msg)
{
	// msg_setPoint = *msg;
}