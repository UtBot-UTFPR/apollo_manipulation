/* 	
	DESCRIÇÃO DO PROGRAMA
	- Realiza o controle da mão no plano XZ
	- Recebe o setpoint e publica o set_angles
	
	TODO
	- booleano canMoveHand

    VALORES DE TESTE
    - (x,z) = (39.101, 32.968) ---> OMB = 30, COT = 60, PUN = -90
*/

#include <stdio.h>
#include <ros/ros.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>
#include <nav_msgs/Odometry.h>
#include <custom_msg/status_arm.h>
#include <custom_msg/set_angles.h>
#include "calculations.hpp"

// *** MENSAGENS RECEBIDAS ***
geometry_msgs::Point msg_setPoint;
bool newSetPoint = false;

// *** MENSAGENS PUBLICADAS ***
custom_msg::set_angles  msg_set_angles;

// *** FUNÇÕES ***
void callback_setPoint(const geometry_msgs::Point::ConstPtr& msg);
void xz_forwardKinematics(geometry_msgs::Point* goal, custom_msg::set_angles* msg_set_angles,
    const float length_OMB, const float length_COT, const float length_PUN);
void xz_inverseKinematics(
    geometry_msgs::Point* goal, custom_msg::set_angles* msg_set_angles,
    const double theta_p,
    const double length_OMB, const double length_COT, const double length_PUN,
    const double correction_OMB, const double correction_COT, const double correction_PUN);

// *** MAIN ***
int main(int argc, char **argv)
{
	// INICIALIZAÇÃO DO NODO
	ros::init(argc, argv, "xz_controller");
	ros::NodeHandle n;

	// PARÂMETROS
	double length_OMB     = 23.5;
	double length_COT     = 24.5;
	double length_PUN     = 6.5;
	double correction_OMB = 0.0;
	double correction_COT = 0.0;
	double correction_PUN = 5.0;
	bool   debug          = false; // Habilita log de debug

	n.getParam("/xz_controller_node/length_OMB", length_OMB);
	n.getParam("/xz_controller_node/length_COT", length_COT);
	n.getParam("/xz_controller_node/length_PUN", length_PUN);
	n.getParam("/xz_controller_node/correction_OMB", correction_OMB);
	n.getParam("/xz_controller_node/correction_COT", correction_COT);
	n.getParam("/xz_controller_node/correction_PUN", correction_PUN);
	n.getParam("/xz_controller_node/debug", debug);

	puts("\n");
	ROS_INFO("length     OMB, COT, PUN: %f, %f, %f", length_OMB, length_COT, length_PUN);
	ROS_INFO("correction OMB, COT, PUN: %f, %f, %f", correction_OMB, correction_COT, correction_PUN);

	if (debug == true)
		ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);

	// SUBSCRIBERS
	ros::Subscriber sub_setPoint = n.subscribe("/arm_setpoint", 1, callback_setPoint);

	// PUBLISHERS
	ros::Publisher pub_set_angles 	= n.advertise<custom_msg::set_angles>("/cmd_3R", 0);

	// VARIÁVEIS DE TEMPO
	ros::Rate loopRate(30);

	// PONTO DESTINO
	msg_setPoint.x = 0;
	msg_setPoint.y = 0;
	msg_setPoint.z = 0;
	
	newSetPoint = true;
	
	// LOOP PRINCIPAL
	while (ros::ok()) {

		loopRate.sleep();
		ros::spinOnce();
		
		// Se setPoint for (0, 0, 0), pula a iteração
		if (msg_setPoint.x == 0 && msg_setPoint.y == 0 && msg_setPoint.z == 0)
			continue;
		
		// Se tiver novo setPoint, ajusta braço
		else if (newSetPoint == true) {
			ROS_INFO("Correction in plane xz...");
			xz_inverseKinematics(&msg_setPoint, &msg_set_angles,
				0.0,
				length_OMB, length_COT, length_PUN,
				correction_OMB, correction_COT, correction_PUN);
			ros::Time::sleepUntil(ros::Time(500));
			msg_set_angles.set_GAR = 180.0;
			newSetPoint = false;
			pub_set_angles.publish(msg_set_angles);
		}
	}
	return 0;
}

void callback_setPoint(const geometry_msgs::Point::ConstPtr& msg)
{
	msg_setPoint = *msg;
	newSetPoint = true;
}

void xz_forwardKinematics(geometry_msgs::Point* goal, custom_msg::set_angles* msg_set_angles,
    const float length_OMB, const float length_COT, const float length_PUN)
{   
    msg_set_angles->set_OMB = 30;
    msg_set_angles->set_COT = 60;
    msg_set_angles->set_PUN = -90;

    float xf = (length_OMB* cosf(degToRad(msg_set_angles->set_OMB))) + (length_COT * cosf(degToRad(msg_set_angles->set_COT))) + length_PUN;
    float z = ( length_OMB * sinf(degToRad((msg_set_angles->set_OMB))) ) +  fabs(   length_COT * sinf(degToRad(msg_set_angles->set_COT)) );
    
    length_COT * sinf(degToRad(msg_set_angles->set_COT));

    ROS_INFO("Forward kin.: xf %f, z %f", xf, z);
    return;
}

/* Cinemática inversa no plano xz */
void xz_inverseKinematics(
    geometry_msgs::Point* goal, custom_msg::set_angles* msg_set_angles,
    const double theta_p,
    const double length_OMB, const double length_COT, const double length_PUN,
    const double correction_OMB, const double correction_COT, const double correction_PUN)
{
    // 'offsetgoal' é o ponto final de omb e cot (sem punho)
    geometry_msgs::Point offsetGoal;
    offsetGoal.x = goal->x - length_PUN * cos(degToRad(theta_p));
    offsetGoal.y = goal->y;
    offsetGoal.z = goal->z - length_PUN * sin(degToRad(theta_p));

    // 'o' é o módulo do vetor omb
    double o = length_OMB;

    // 'c' é o módulo do vetor cot
    double c = length_COT;

    // 'v' é o módulo do vetor resultante entre omb e cot 
    double v = sqrt(pow(offsetGoal.x, 2) + pow(offsetGoal.z, 2));

    /* 'delta' é o ângulo do triângulo retângulo: 
        - cateto oposto: 'offsetGoal.z'
        - hipotenusa:    'v'
    */ 
    double delta = asin(offsetGoal.z/v);

    /* 'alpha' é um ângulo obtido por lei dos cossenos
        - lado oposto a 'alpha': 'c'
        - outros 2 lados: 'v' e 'o'
    */
    double alpha = acos((pow(v,2)+pow(o,2)-pow(c,2))/(2*v*o));

    /* 'beta' é um ângulo obtido por lei dos cossenos
        - lado oposto a 'beta': 'v'
        - outros 2 lados: 'c' e 'o'
    */
    double beta = acos((pow(o,2)+pow(c,2)-pow(v,2))/(2*c*o));

    /* 'theta1', 'theta2' e 'theta3' são os ângulos do braço SEM CORREÇÃO
        - theta1: set_OMB
        - theta2: set_COT
        - theta3: set_PUN
    */
    double theta1 = radToDeg(delta - alpha);
    double theta2 = radToDeg(M_PI - beta);
    double theta3 = - (theta1 + theta2) + theta_p;

    ROS_INFO(" - goal       (%f, %f, %f)",                  goal->x , goal->y, goal->z);
    ROS_INFO(" - v          %f",                            v);
    ROS_INFO(" - offsetGoal (%f, %f, %f)",                  offsetGoal.x , offsetGoal.y, offsetGoal.z);
    ROS_INFO(" - theta1, theta2, theta3: %f, %f, %f\n\n",   theta1, theta2, theta3);

    // Safeguards (prevenir resultados perigosos)
    if (v > 54.5     || v < 9.0         ||
        theta1 > 90  || theta1 < -45    ||
        theta2 > 150 || theta1 < -150   ||
        theta3 > 360 || theta3 < -360) {
        ROS_INFO("SAFEGUARD!");
        return;
    }

    ROS_INFO("Changing set_angles!");
    msg_set_angles->set_OMB = theta1 + correction_OMB;
    msg_set_angles->set_COT = theta2 + correction_COT;
    msg_set_angles->set_PUN = theta3 + correction_PUN;
}