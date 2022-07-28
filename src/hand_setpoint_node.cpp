#include <stdio.h>
#include <ros/ros.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>
#include <nav_msgs/Odometry.h>
#include <custom_msg/status_arm.h>
#include <custom_msg/set_angles.h>
#include "3r_kinematics.hpp"

// *** PARÂMETROS ***
// Comprimento de cada parte do braço (cm)
double length_OMB = 23.5;
double length_COT = 24.5;
double length_PUN = 6.5;
// Correções de ângulo a serem aplicadas
double correction_OMB = 0.0;
double correction_COT = 0.0;
double correction_PUN = 10.0;

// *** MENSAGENS RECEBIDAS ***
geometry_msgs::Point msg_setPoint;
bool newSetPoint = false;

// *** MENSAGENS PUBLICADAS ***
custom_msg::set_angles  msg_set_angles;

// *** FUNÇÕES ***
void callback_setPoint(const geometry_msgs::Point::ConstPtr& msg);

// *** MAIN ***
int main(int argc, char **argv)
{
	// INICIALIZAÇÃO DO NODO
	ros::init(argc, argv, "hand_setpoint_node");
	ros::NodeHandle n;

	n.getParam("/hand_setpoint_node/length_OMB", length_OMB);
	n.getParam("/hand_setpoint_node/length_COT", length_COT);
	n.getParam("/hand_setpoint_node/length_PUN", length_PUN);
	n.getParam("/hand_setpoint_node/correction_OMB", correction_OMB);
	n.getParam("/hand_setpoint_node/correction_COT", correction_COT);
	n.getParam("/hand_setpoint_node/correction_PUN", correction_PUN);

	puts("\n");
	ROS_INFO("length     OMB, COT, PUN: %f, %f, %f", length_OMB, length_COT, length_PUN);
	ROS_INFO("correction OMB, COT, PUN: %f, %f, %f", correction_OMB, correction_COT, correction_PUN);

	// SUBSCRIBERS
	ros::Subscriber sub_setPoint = n.subscribe("/arm_setpoint", 1, callback_setPoint);

	// PUBLISHERS
	ros::Publisher pub_set_angles 	= n.advertise<custom_msg::set_angles>("/cmd_3R", 0);

	// VARIÁVEIS DE TEMPO
	ros::Rate loopRate(30);

	// PONTO DESTINO
	msg_setPoint.x = 24;
	msg_setPoint.y = 0;
	msg_setPoint.z = 0;
	newSetPoint = true;
	
	// LOOP PRINCIPAL
	while (ros::ok()) {
		loopRate.sleep();
		ros::spinOnce();
		if (newSetPoint == true) {
			ROS_INFO("Correction in plane xz...");
			xz_inverseKinematics(&msg_setPoint, &msg_set_angles,
				0,
				length_OMB, length_COT, length_PUN,
				correction_OMB, correction_COT, correction_PUN);
			newSetPoint = false;
		}
		pub_set_angles.publish(msg_set_angles);
	}
	return 0;
}

void callback_setPoint(const geometry_msgs::Point::ConstPtr& msg)
{
	msg_setPoint = *msg;
	newSetPoint = true;
}