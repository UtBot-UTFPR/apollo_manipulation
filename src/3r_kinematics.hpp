#ifndef KINEMATICS_HPP
#define KINEMATICS_HPP

#include <math.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Quaternion.h>
#include <tf/tf.h>
#include <custom_msg/set_angles.h>

#define degToRad(angleInDegrees) ((angleInDegrees) * M_PI / 180.0)
#define radToDeg(angleInRadians) ((angleInRadians) * 180.0 / M_PI)

/*
    VALORES DE TESTE
    - (x,y) = (39.101, 32.968) ---> OMB = 30, COT = 60, PUN = -90
*/

double getYaw(geometry_msgs::Quaternion orientation)
{
    tf::Quaternion q(
        orientation.x,
        orientation.y,
        orientation.z,
        orientation.w);
    double yaw = tf::getYaw(q);
    ROS_INFO("yaw %f", yaw);
    return yaw;
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
    double theta1 = delta - alpha;
    double theta2 = M_PI - beta;
    double theta3 = - (theta1 + theta2) + degToRad(theta_p);

    // Safeguards (prevenir resultados perigosos)
    if (v > 54.5 || v < 9.0)
        return;
    if (theta1 > 90 || theta1 < -45)
        return;
    if (theta2 > 150 || theta1 < -150)
        return;
    if (theta3 > 360 || theta3 < -360)
        return;

    msg_set_angles->set_OMB = radToDeg(theta1) + correction_OMB;
    msg_set_angles->set_COT = radToDeg(theta2) + correction_COT;
    msg_set_angles->set_PUN = radToDeg(theta3) + correction_PUN;

    ROS_INFO(" - goal       (%f, %f, %f)", goal->x , goal->y, goal->z);
    ROS_INFO(" - offsetGoal (%f, %f, %f)", offsetGoal.x , offsetGoal.y, offsetGoal.z);
    ROS_INFO(" - theta1, theta2, theta3 (deg): %f, %f, %f\n\n", radToDeg(theta1), radToDeg(theta2), radToDeg(theta3));
}

/* Cinemática inversa no plano xy (ajuste de yaw)
    - Kp: constante de proporcionalidade do PID
    - yaw_max_error: erro angular máximo, abaixo do qual a orientação está "certa"*/
void xy_inverseKinematics(
    geometry_msgs::Point* goal, geometry_msgs::Twist* msg_cmd_vel,
    ros::Publisher* pub_cmd_vel,
    nav_msgs::Odometry* msg_odom, ros::Rate* loopRate, 
    const double Kp, const double yaw_max_error)
{
    // Yaw absoluto, inicialmente: 
    double yaw_start_absolute = radToDeg(getYaw(msg_odom->pose.pose.orientation));
    ROS_INFO("orientation %f %f %f %f",   msg_odom->pose.pose.orientation.w, msg_odom->pose.pose.orientation.x, msg_odom->pose.pose.orientation.y, msg_odom->pose.pose.orientation.z);

    // Quanto precisa girar:
    double yaw_target_relative = radToDeg(atan2(goal->x, goal->y)) - yaw_start_absolute;
    
    // Yaw atual, relativo ao yaw_start:
    double yaw_current_relative = 0.0;

    // Erro de orientação:
    double yaw_error = yaw_target_relative - yaw_current_relative;

    while (/*yaw_error < yaw_max_error &&*/ ros::ok()) {
        loopRate->sleep();
		ros::spinOnce();

        // Determina o yaw atual, em relação ao yaw_start:
        yaw_current_relative = radToDeg(getYaw(msg_odom->pose.pose.orientation)) - yaw_start_absolute;

        // Erro de yaw é quanto falta pro yaw atual chegar no target:
        yaw_error = yaw_target_relative - yaw_current_relative;

        // Output do sistema é um comando de velocidade de rotação:
        msg_cmd_vel->linear.x = 0.0;
        msg_cmd_vel->linear.y = 0.0;
        msg_cmd_vel->linear.z = 0.0;
        msg_cmd_vel->angular.x = 0.0;
        msg_cmd_vel->angular.y = 0.0;
        msg_cmd_vel->angular.z = Kp * yaw_error;

        // Publica a mensagagem
        // pub_cmd_vel->publish(*msg_cmd_vel);

        // ROS_INFO("yaw_start_absolute %f",   yaw_start_absolute);
        // ROS_INFO("yaw_target_relative %f",  yaw_target_relative);
        // ROS_INFO("yaw_current_relative %f", yaw_current_relative);
        // ROS_INFO("yaw_error %f",            yaw_error);
        // ROS_INFO("yaw_max_error %f",        yaw_max_error);
        // ROS_INFO("w_z %f",                  msg_cmd_vel->angular.z);
        // ROS_INFO("Kp %f",                   Kp);
    }
}

#endif