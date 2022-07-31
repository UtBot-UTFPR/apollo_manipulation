/* 	
	DESCRIÇÃO DO PROGRAMA
	- Realiza o controle da mão no plano XY, rotacionando o robô em torno do eixo z (yaw)
	- Recebe o setpoint e publica o cmd_vel
	
	TODO
	- booleano canMoveHand
	- simulador não está publicando odom	

	CONVENÇÃO DE SINAL
	- Negativo: rotação horária
	- Positivo: rotação anti-horária
*/

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
bool newOdom	 = false;

// *** MENSAGENS PUBLICADAS ***
geometry_msgs::Twist  msg_cmd_vel;

// *** FUNÇÕES ***
void callback_Odom      (const nav_msgs::Odometry::ConstPtr& msg);
void callback_setPoint  (const geometry_msgs::Point::ConstPtr& msg);
void initializeYawData(const nav_msgs::Odometry* odom, const geometry_msgs::Point* goal,
	double* yaw_start_absolute, double* yaw_target_relative);
void updateYawData(const double yaw_start_absolute, const double yaw_target_relative,
	const double yaw_acceptable_error, const double Kp, const nav_msgs::Odometry* odom,
	double* yaw_current_relative, double* yaw_error);
void waitForOdom(ros::Rate* loopRate, bool* newOdom);

// *** MAIN ***
int main(int argc, char **argv)
{
	// INICIALIZAÇÃO DO NODO
	ros::init(argc, argv, "xy_controller");
	ros::NodeHandle n;

	// SUBSCRIBERS
	ros::Subscriber sub_setPoint = n.subscribe("/arm_setpoint", 0, callback_setPoint);
	ros::Subscriber sub_odom     = n.subscribe("/odom",         0, callback_Odom    );

	// PUBLISHERS
	ros::Publisher pub_cmd_vel = n.advertise<geometry_msgs::Twist>("/cmd_vel", 0);

	// VARIÁVEIS DE TEMPO
	ros::Rate loopRate(30);

	// PARÂMETROS
	double yaw_acceptable_error = 5.0;   // Erro aceitável
	double Kp                   = 0.3;   // Constante de proporção
	bool   debug                = false; // Habilita log de debug
	
	n.getParam("/xy_controller_node/yaw_acceptable_error", yaw_acceptable_error);
	n.getParam("/xy_controller_node/Kp", Kp);
	n.getParam("/xy_controller_node/debug", debug);

	ROS_INFO("[xy controller] PARAMETERS");
	ROS_INFO(" - yaw_max_error %f", yaw_acceptable_error);
	ROS_INFO(" - debug %i",         debug);
	ROS_INFO(" - Kp %f\n\n\n",      Kp);

	if (debug == true)
		ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);

	// PONTO DESTINO
	msg_setPoint.x = 0.0;
	msg_setPoint.y = 0.0;
	msg_setPoint.z = 0.0;

	// Variáveis de yaw (graus)
	double yaw_start_absolute         = 0.0; // Yaw absoluto, inicialmente
	double yaw_target_relative        = 0.0; // Quanto precisa girar, relativo ao yaw inicial
	double yaw_current_relative       = 0.0; // Yaw atual, relativo ao yaw inicial
	double yaw_error                  = 0.0; // Erro de orientação

	// Inicialização de variáveis
	memset(&msg_cmd_vel, 0, sizeof(geometry_msgs::Twist));
	memset(&msg_odom, 0, sizeof(nav_msgs::Odometry));
	
	// LOOP PRINCIPAL
	while (ros::ok()) {
		loopRate.sleep();
		ros::spinOnce();
		if (newSetPoint == true) { // Se há um novo goal, ajusta a orientação até ele
			newSetPoint = false;
			ROS_DEBUG("[xy controller] Goal is (%f, %f, %f)", msg_setPoint.x, msg_setPoint.y, msg_setPoint.z);
			msg_cmd_vel.angular.z = 0.0;
			pub_cmd_vel.publish(msg_cmd_vel);
			waitForOdom(&loopRate, &newOdom);
			initializeYawData(&msg_odom, &msg_setPoint, &yaw_start_absolute, &yaw_target_relative);
			while (ros::ok()) {
				loopRate.sleep();
				ros::spinOnce();
				waitForOdom(&loopRate, &newOdom);
				updateYawData(yaw_start_absolute, yaw_target_relative, yaw_acceptable_error, 
					Kp, &msg_odom, &yaw_current_relative, &yaw_error);
				if (msg_setPoint.x != 0.0 ||
					msg_setPoint.y != 0.0 ||
					msg_setPoint.z != 0.0) {
					ROS_DEBUG("[xy controller] Valid goal.");
					if (fabs(yaw_error) > yaw_acceptable_error) {
						ROS_DEBUG("[xy controller] Haven't arrived yet. Correcting orientation...");
						msg_cmd_vel.angular.z = Kp * yaw_error;
					}
					else {
						ROS_DEBUG("[xy controller] Arrived! Time to stop.");
						msg_cmd_vel.angular.z = 0.0;
					}
					pub_cmd_vel.publish(msg_cmd_vel);
				}
				else {
					ROS_DEBUG("[xy controller] Nothing to do here.");
					msg_cmd_vel.angular.z = 0.0;
					pub_cmd_vel.publish(msg_cmd_vel);
				}	
			}
		}
	}
	return 0;
}

void callback_Odom (const nav_msgs::Odometry::ConstPtr& msg)
{
	msg_odom = *msg;
	newOdom  = true;
}

void callback_setPoint(const geometry_msgs::Point::ConstPtr& msg)
{
	if (msg->x != msg_setPoint.x || 
		msg->y != msg_setPoint.y || 
		msg->z != msg_setPoint.z) {
			newSetPoint  = true;
			msg_setPoint = *msg;
			ROS_INFO("[xy controller] New point!");
	}
}

void initializeYawData(const nav_msgs::Odometry* odom, const geometry_msgs::Point* goal,
	double* yaw_start_absolute, double* yaw_target_relative)
{
	*yaw_start_absolute = radToDeg(getYaw(odom->pose.pose.orientation));
	*yaw_target_relative = radToDeg(atan2(goal->y, goal->x));
	ROS_INFO("[xy controller] Initializing xy rotation...");
	ROS_INFO(" - Yaw: start(abs)  = %f", *yaw_start_absolute);
	ROS_INFO(" - Yaw: target(rel) = %f", *yaw_target_relative);
}

void updateYawData(const double yaw_start_absolute, const double yaw_target_relative,
	const double yaw_acceptable_error, const double Kp, const nav_msgs::Odometry* odom,
	double* yaw_current_relative, double* yaw_error)
{
	double yaw_current_abs = radToDeg(getYaw(odom->pose.pose.orientation));
	*yaw_current_relative = yaw_current_abs - yaw_start_absolute;
	*yaw_error = yaw_target_relative - *yaw_current_relative;
	ROS_DEBUG("[xy controller] Updating yaw data...");
	ROS_DEBUG(" - yaw_start_absolute   = %f", yaw_start_absolute);
	ROS_DEBUG(" - yaw_target_relative  = %f", yaw_target_relative);
	ROS_DEBUG(" - yaw_current_relative = %f", *yaw_current_relative);
	ROS_DEBUG(" - yaw_error            = %f", *yaw_error);
	ROS_DEBUG(" - w_z                  = %f", Kp * (*yaw_error));
	ROS_DEBUG(" - yaw_current_abs      = %f", yaw_current_abs);
	ROS_DEBUG(" - orientation          = (%f, %f, %f, %f)", 
		odom->pose.pose.orientation.w, odom->pose.pose.orientation.x,
		odom->pose.pose.orientation.y, odom->pose.pose.orientation.z);
}

// Espera a odometria atualizar
void waitForOdom(ros::Rate* loopRate, bool* newOdom)
{
	ROS_DEBUG("[xy controller] Waiting for odometry");
	while (ros::ok() && *newOdom == false) {
		loopRate->sleep();
		ros::spinOnce();
	}
	ROS_DEBUG("[xy controller] Odometry ok");
	*newOdom = false;	
}