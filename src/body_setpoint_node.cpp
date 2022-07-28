// TODO: parâmetros Kp e erro angular

#include <ros/ros.h>
#include <tf/tf.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Twist.h>
#include <nav_msgs/Odometry.h>
#include <math.h>
#include "calculations.hpp"

// *** MENSAGENS RECEBIDAS ***
nav_msgs::Odometry msg_odom;
geometry_msgs::Point msg_setPoint;
bool newSetPoint = false;

// *** MENSAGENS PUBLICADAS ***
geometry_msgs::Twist  msg_cmd_vel;

// *** FUNÇÕES ***
void callback_Odom      (const nav_msgs::Odometry::ConstPtr& msg);
void callback_setPoint  (const geometry_msgs::Point::ConstPtr& msg);
void xy_inverseKinematics(
	ros::Publisher* pub_cmd_vel, ros::Rate* loopRate,
    const double Kp, const double yaw_acceptable_error);
void printLogs(
	double yaw_start_absolute, double yaw_target_relative,
	double yaw_current_relative, 
	double yaw_error, double yaw_acceptable_error, 
	double w_z,	double Kp);

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
	msg_setPoint.x = 0.0;
	msg_setPoint.y = 0.0;
	msg_setPoint.z = 0.0;

	newSetPoint = true;
	memset(&msg_odom, 0, sizeof(nav_msgs::Odometry));
	
	// LOOP PRINCIPAL
	while (ros::ok()) {
		loopRate.sleep();
		ros::spinOnce();
		if (newSetPoint == true) {
			newSetPoint = false;
            xy_inverseKinematics(
				&pub_cmd_vel, &loopRate,
				0.05, 5);
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
	ROS_INFO("New point!");
}

/* Cinemática inversa no plano xy (ajuste de yaw)
    - Kp: constante de proporcionalidade do PID
    - yaw_acceptable_error: erro angular máximo, abaixo do qual a orientação está "certa"*/
void xy_inverseKinematics(
	ros::Publisher* pub_cmd_vel, ros::Rate* loopRate,
    const double Kp, const double yaw_acceptable_error)
{
	// Se setPoint for (0, 0, 0), retorna
	if (msg_setPoint.x == 0 && msg_setPoint.y == 0 && msg_setPoint.z == 0)
		return;				

	double yaw_start_absolute 	 = radToDeg(getYaw(msg_odom.pose.pose.orientation)); // Yaw absoluto, inicialmente
	double yaw_target_relative  = radToDeg(atan2(msg_setPoint.x, msg_setPoint.y)) - yaw_start_absolute; // Quanto precisa girar
	double yaw_current_relative = 0.0; // Yaw atual, relativo ao yaw_start
	double yaw_error 			 = yaw_target_relative - yaw_current_relative; // Erro de orientação

	// Aguarda yaw_error não ser NaN
	while (yaw_error != yaw_error) {
		loopRate->sleep();
		ros::spinOnce();
		yaw_start_absolute 	 = radToDeg(getYaw(msg_odom.pose.pose.orientation));
		yaw_target_relative  = radToDeg(atan2(msg_setPoint.x, msg_setPoint.y)) - yaw_start_absolute;
		yaw_current_relative = 0.0;
		yaw_error 			 = yaw_target_relative - yaw_current_relative;
	}

	while (ros::ok() && fabs(yaw_error) > yaw_acceptable_error && newSetPoint == false
		&& !(msg_setPoint.x == 0 && msg_setPoint.y == 0 && msg_setPoint.z == 0)) {
		loopRate->sleep();
		ros::spinOnce();

		ROS_INFO("Correcting yaw...");

		// Determina o yaw atual, em relação ao yaw_start:
        yaw_current_relative = radToDeg(getYaw(msg_odom.pose.pose.orientation)) - yaw_start_absolute;

        // Erro de yaw é quanto falta pro yaw atual chegar no target:
        yaw_error = yaw_target_relative - yaw_current_relative;

        // Output do PID é um comando de velocidade para girar:
        msg_cmd_vel.linear.x = 0.0;
        msg_cmd_vel.linear.y = 0.0;
        msg_cmd_vel.linear.z = 0.0;
        msg_cmd_vel.angular.x = 0.0;
        msg_cmd_vel.angular.y = 0.0;
        msg_cmd_vel.angular.z = Kp * yaw_error;

        // Publica a mensagagem
        pub_cmd_vel->publish(msg_cmd_vel);

        printLogs(
			yaw_start_absolute, yaw_target_relative,
			yaw_current_relative, 
			yaw_error, yaw_acceptable_error,
			msg_cmd_vel.angular.z, Kp);
    }

	// Para de girar
	ROS_INFO("Stopping yaw rotation.");
	msg_cmd_vel.angular.z = 0.0;
	pub_cmd_vel->publish(msg_cmd_vel);
}

void printLogs(
	double yaw_start_absolute, double yaw_target_relative,
	double yaw_current_relative, 
	double yaw_error, double yaw_acceptable_error, 
	double w_z,	double Kp)
{
	ROS_INFO("yaw_start_absolute %f",   yaw_start_absolute);
	ROS_INFO("yaw_target_relative %f",  yaw_target_relative);
	ROS_INFO("yaw_current_relative %f", yaw_current_relative);
	ROS_INFO("yaw_error %f",            yaw_error);
	// ROS_INFO("yaw_max_error %f",        yaw_acceptable_error);
	ROS_INFO("w_z %f",                  w_z);
	// ROS_INFO("Kp %f\n\n\n",            Kp);
}
       

	// ROS_INFO("%f %f %f %f", 
	// 	msg_odom.pose.pose.orientation.w, 
	// 	msg_odom.pose.pose.orientation.x, 
	// 	msg_odom.pose.pose.orientation.y, 
	// 	msg_odom.pose.pose.orientation.z);