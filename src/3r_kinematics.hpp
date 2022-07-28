#ifndef KINEMATICS_HPP
#define KINEMATICS_HPP

#include <math.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Quaternion.h>
#include <tf/tf.h>
#include <custom_msg/set_angles.h>
#include "calculations.hpp"

/*
    VALORES DE TESTE
    - (x,y) = (39.101, 32.968) ---> OMB = 30, COT = 60, PUN = -90
*/

void xz_forwardKinematics(geometry_msgs::Point* goal, custom_msg::set_angles* msg_set_angles,
    const float length_OMB, const float length_COT, const float length_PUN)
{   
    msg_set_angles->set_OMB = 30;
    msg_set_angles->set_COT = 60;
    msg_set_angles->set_PUN = -90;

    float xf = (length_OMB* cosf(degToRad(msg_set_angles->set_OMB))) + (length_COT * cosf(degToRad(msg_set_angles->set_COT))) + length_PUN;
    float z = ( length_OMB * sinf(degToRad((msg_set_angles->set_OMB))) ) +  fabs(   length_COT * sinf(degToRad(msg_set_angles->set_COT)) );
    
    length_COT * sinf(degToRad(msg_set_angles->set_COT));

    ROS_INFO("(forward) xf %f, z %f", xf, z);
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
    double theta3 = - (theta1 + theta2) + degToRad(theta_p);

    ROS_INFO(" - goal       (%f, %f, %f)",                  goal->x , goal->y, goal->z);
    ROS_INFO(" - v          %f",                            v);
    ROS_INFO(" - offsetGoal (%f, %f, %f)",                  offsetGoal.x , offsetGoal.y, offsetGoal.z);
    ROS_INFO(" - theta1, theta2, theta3: %f, %f, %f\n\n",   theta1, theta2, theta3);

    // Safeguards (prevenir resultados perigosos)
    if (v > 54.5 || v < 9.0)
        return;
    if (theta1 > 90 || theta1 < -45)
        return;
    if (theta2 > 150 || theta1 < -150)
        return;
    if (theta3 > 360 || theta3 < -360)
        return;

    ROS_INFO("Changing set_angles");

    msg_set_angles->set_OMB = theta1 + correction_OMB;
    msg_set_angles->set_COT = theta2 + correction_COT;
    msg_set_angles->set_PUN = theta3 + correction_PUN;
}

#endif