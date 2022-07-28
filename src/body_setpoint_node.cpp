// TODO: parâmetros Kp e erro angular

#include <stdio.h>
#include <ros/ros.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include "3r_kinematics.hpp"

// *** MENSAGENS RECEBIDAS ***
nav_msgs::Odometry msg_odom;
geometry_msgs::Point msg_setPoint;
bool newSetPoint = false;

// *** MENSAGENS PUBLICADAS ***
geometry_msgs::Twist  msg_cmd_vel;

// *** FUNÇÕES ***
void callback_Odom      (const nav_msgs::Odometry::ConstPtr& msg);
void callback_setPoint  (const geometry_msgs::Point::ConstPtr& msg);

// *** MAIN ***
int main(int argc, char **argv)
{
	// INICIALIZAÇÃO DO NODO
	ros::init(argc, argv, "body_setpoint_node");
	ros::NodeHandle n;

	// SUBSCRIBERS
	ros::Subscriber sub_setPoint = n.subscribe("/arm_setpoint", 1, callback_setPoint);
	ros::Subscriber sub_odom     = n.subscribe("/odom",         1, callback_Odom    );

	// PUBLISHERS
	ros::Publisher pub_cmd_vel = n.advertise<geometry_msgs::Twist>("/cmd_vel", 0);

	// VARIÁVEIS DE TEMPO
	ros::Rate loopRate(30);

	// PONTO DESTINO
	msg_setPoint.x = 15;
	msg_setPoint.y = 15;
	msg_setPoint.z = 0;
	newSetPoint = true;
	
	// LOOP PRINCIPAL
	while (ros::ok()) {
		loopRate.sleep();
		ros::spinOnce();
		if (newSetPoint == true || newSetPoint == false) {
			ROS_INFO("Correction of yaw...");
            xy_inverseKinematics(&msg_setPoint, &msg_cmd_vel, &pub_cmd_vel, &msg_odom, &loopRate, 1.05, 5);
			newSetPoint = false;
		}
	}
	return 0;
}

void callback_Odom (const nav_msgs::Odometry::ConstPtr& msg)
{
	msg_odom = *msg;
}

void callback_setPoint(const geometry_msgs::Point::ConstPtr& msg)
{
	msg_setPoint = *msg;
	newSetPoint = true;
}