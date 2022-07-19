#ifndef KINEMATICS_HPP
#define KINEMATICS_HPP

#include <math.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Vector3.h>

#define degToRad(angleInDegrees) ((angleInDegrees) * M_PI / 180.0)
#define radToDeg(angleInRadians) ((angleInRadians) * 180.0 / M_PI)

void inverseKinematics(geometry_msgs::Point* goal, custom_msg::set_angles* msg_set_angles)
{
	float xf = goal->x;
    float y;

    float x = xf-6.5;
    float v = sqrt((pow(x,2)+pow(y,2)));
    
    float al_rad = acos((600.25+pow(v,2)-552.25)/(48*v));
    float al_deg = radToDeg(al_rad);
    
    // Calculo do angulo cotovelo
    float thC_rad = acos((552.25+pow(v,2)-600.25)/(47*v));
    float thC_deg = radToDeg(thC_rad);
    
    // Calculo do angulo ombro
    float thO_deg = 90 - al_deg;
    float gam_deg = 90 - thO_deg;
    
    // Calculo do angulo punho
    float thP_deg = 2*thO_deg - gam_deg;

    // ...
    
    msg_set_angles->set_OMB = thO_deg;
    msg_set_angles->set_COT = thC_deg;
    msg_set_angles->set_PUN = thP_deg;
}

#endif