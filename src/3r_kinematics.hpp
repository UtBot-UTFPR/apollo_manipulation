#ifndef KINEMATICS_HPP
#define KINEMATICS_HPP

#include <math.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>

#define degToRad(angleInDegrees) ((angleInDegrees) * M_PI / 180.0)
#define radToDeg(angleInRadians) ((angleInRadians) * 180.0 / M_PI)

/*
    Valores de teste
	- (x,y) = (39.101, 32.968) ---> OMB = 30, COT = 60, PUN = -90
*/

void forwardKinematics(geometry_msgs::Point* goal, custom_msg::set_angles* msg_set_angles,
    const float length_OMB, const float length_COT, const float length_PUN)
{   
    msg_set_angles->set_OMB = 30;
    msg_set_angles->set_COT = 60;
    msg_set_angles->set_PUN = -90;

    float xf = (length_OMB* cosf(degToRad(msg_set_angles->set_OMB))) + (length_COT * cosf(degToRad(msg_set_angles->set_COT))) + length_PUN;
        // float y  = ((length_OMB * sinf(degToRad(90/*msg_set_angles->set_OMB*/))) + (length_COT * sinf(degToRad(msg_set_angles->set_COT))));
    float y = ( length_OMB * sinf(degToRad((msg_set_angles->set_OMB))) ) +  fabs(   length_COT * sinf(degToRad(msg_set_angles->set_COT)) )     ;                
    
    
    length_COT * sinf(degToRad(msg_set_angles->set_COT));

    ROS_INFO("(forward) xf %f, y %f", xf, y);
    return;
}

void inverseKinematics(geometry_msgs::Point* goal, custom_msg::set_angles* msg_set_angles,
    const float length_OMB, const float length_COT, const float length_PUN,
    const float correction_OMB, const float correction_COT, const float correction_PUN)
{
    geometry_msgs::Point offsetGoal;
    offsetGoal.x = goal->x - length_PUN;
    offsetGoal.y = goal->y;
    offsetGoal.z = goal->z;

    double o = length_OMB;
    double c = length_COT;
    double v = sqrt(pow(offsetGoal.x, 2) + pow(offsetGoal.y, 2));

    

    double delta = asin(offsetGoal.y/v);
    double alpha = acos((pow(v,2)+pow(o,2)-pow(c,2))/(2*v*o));
    double beta = acos((pow(o,2)+pow(c,2)-pow(v,2))/(2*c*o));

    double theta1 = delta - alpha;
    double theta2 = M_PI - beta;
    double theta3 = - (theta1 + theta2);

    // Safeguard
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

    msg_set_angles->set_Kp_OMB = 9;
    msg_set_angles->set_Kp_PUN = 9;

    ROS_INFO("goal (%f, %f)", goal->x , goal->y);
    ROS_INFO("offsetGoal (%f, %f)", offsetGoal.x , offsetGoal.y);
    // ROS_INFO("v1 %f, v2 %f, v_res_1_2 %f", v1, v2, v_res_1_2);
    // ROS_INFO("alpha (deg) %f, beta (deg) %f", radToDeg(alpha), radToDeg(beta));
    ROS_INFO("theta1 (deg) %f , theta2 (deg) %f, theta3 (deg) %f\n\n", radToDeg(theta1), radToDeg(theta2), radToDeg(theta3));
}

#endif



    // float xf = goal->x;
    // float y  = goal->y;

    // float x = xf - length_PUN;
    // float v = sqrt((pow(x,2)+pow(y,2)));
    
    // float al_rad = acos((pow(length_COT,2)+pow(v,2)-pow(length_OMB,2))/(2*length_COT*v));
    // float al_deg = radToDeg(al_rad);
    
    // // Calculo do angulo cotovelo
    // float thC_rad = acos((pow(length_OMB,2)+pow(v,2)-pow(length_COT,2))/(2*length_OMB*v));
    // float thC_deg = radToDeg(thC_rad);
    
    // // Calculo do angulo ombro
    // float thO_deg = 90 - al_deg;
    
    // // Calculo do angulo punho
    // float thP_deg = 15 - thO_deg;

    // msg_set_angles->set_OMB = thO_deg;
    // msg_set_angles->set_COT = thC_deg;
    // msg_set_angles->set_PUN = thP_deg;

    // v=90;

    // if (v > 48) {
    //     msg_set_angles->set_OMB = 0;
    //     msg_set_angles->set_COT = 0;
    //     msg_set_angles->set_PUN = -90;
    // }

    // ROS_INFO("xf %f, y %f     x %f       v %f", xf, y, x, v);
    // ROS_INFO("\nal_rad %f,   al_deg %f", al_rad, al_deg);
    // ROS_INFO("thC_deg %f", thC_deg);
    // ROS_INFO("thO_deg %f", thO_deg);
    // ROS_INFO("thP_deg %f", thP_deg);














//     float xf = goal->x;
//     float y  = goal->y;

//     float x = xf - length_PUN;
//     float v = sqrt((pow(x,2)+pow(y,2)));
    
//     float al_rad = acos((pow(length_COT,2)+pow(v,2)-pow(length_OMB,2))/(2*length_COT*v));
//     float al_deg = radToDeg(al_rad);
    
//     float be_rad = acos((pow(length_OMB,2)-pow(v,2)+pow(length_COT,2))/(2*length_OMB*v));
//     float be_deg = radToDeg(be_rad);
// // Calculo do angulo ombro
//     float thO_deg = al_deg;
    
//     // Calculo do angulo cotovelo
//     //float thC_rad = acos((pow(length_OMB,2)+pow(v,2)-pow(length_COT,2))/(2*length_OMB*v));
//     //float thC_deg = radToDeg(thC_rad);

//     float thC_deg = -(180 - be_deg);
    
    
//     // Calculo do angulo punho
//     float thP_deg = 15 - thO_deg - thC_deg;
    

//     msg_set_angles->set_OMB = thO_deg;
//     msg_set_angles->set_COT = thC_deg;
//     msg_set_angles->set_PUN = thP_deg;

//     //v=90;

//     if (v > 48) {
//         msg_set_angles->set_OMB = 0;
//         msg_set_angles->set_COT = 0;
//         msg_set_angles->set_PUN = -90;
//     }

//     ROS_INFO("xf %f, y %f     x %f       v %f", xf, y, x, v);
//     ROS_INFO("\nal_rad %f,   al_deg %f", al_rad, al_deg);
//     ROS_INFO("thO_deg %f", thO_deg);
//     ROS_INFO("thC_deg %f", thC_deg);
//     ROS_INFO("thP_deg %f", thP_deg);




// Acha-se α por lei dos cossenos
    // double cos_alpha = (pow(v2, 2) - pow(v_res_1_2, 2) + pow(v1, 2)) / (2* v_res_1_2 * v1);
    // double alpha = acos(cos_alpha);

    // // Acha-se θ1 por relação de triângulo retângulo
    // double sin_beta = offsetGoal.y  / v_res_1_2;
    // double cos_beta = offsetGoal.x / v_res_1_2;
    // double beta = asin(sin_beta);

    // double theta1 = beta + alpha;

    // // Acha-se θ2 comparando os vetores
    // double sin_theta2 = (offsetGoal.y - (v1*sin(theta1))) / v2;
    // double cos_theta2 = (offsetGoal.x - (v1*cos(theta1))) / v2;
    // double theta2 = asin(sin_theta2);

    // // Acha-se θ3
    // double theta3 = - theta1 - theta2;