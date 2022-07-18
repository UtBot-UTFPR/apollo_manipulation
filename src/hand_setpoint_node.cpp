#include <stdio.h>
#include <ros/ros.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>
#include <custom_msg/status_arm.h>
#include <custom_msg/set_angles.h>

// MENSAGENS RECEBIDAS
geometry_msgs::Point 	msg_setPoint;

// MENSAGENS PUBLICADAS
custom_msg::set_angles msg_set_angles;

// FUNÇÕES
void callback_setPoint		(const geometry_msgs::Point::ConstPtr&		msg);
void moveHand();
void inverseKinematics();

// FUNÇÃO MAIN
int main(int argc, char **argv)
{
	// INICIALIZAÇÃO DO NODO
	ros::init(argc, argv, "hand_setpoint_node");
	ros::NodeHandle n;	
	
	// SUBSCRIBERS
	ros::Subscriber sub_setPoint	= n.subscribe("/arm/setpoint", 1, callback_setPoint);
	
	// PUBLISHERS
	ros::Publisher pub_set_angles 	= n.advertise<custom_msg::set_angles>("/cmd_3R", 1000);

	// VARIÁVEIS DE TEMPO
	ros::Rate loopRate(30);
	
	// LOOP PRINCIPAL
	while (ros::ok()) {
		loopRate.sleep();
		ros::spinOnce();
		inverseKinematics();
		pub_set_angles.publish(msg_set_angles);
	}
	
	return 0;
}

void callback_setPoint(const geometry_msgs::Point::ConstPtr& msg)
{
	msg_setPoint 	= *msg;
}

void inverseKinematics()
{
	//
}