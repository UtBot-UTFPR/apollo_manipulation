#ifndef CALCULATIONS_HPP
#define CALCULATIONS_HPP

#include <tf/tf.h>
#include <geometry_msgs/Quaternion.h>

#define degToRad(angleInDegrees) ((angleInDegrees) * M_PI / 180.0)
#define radToDeg(angleInRadians) ((angleInRadians) * 180.0 / M_PI)

double getYaw(geometry_msgs::Quaternion orientation)
{
	tf::Quaternion q(
		orientation.x, orientation.y,
        orientation.z, orientation.w);
    tf::Matrix3x3 m(q);
    double roll, pitch, yaw;
    m.getRPY(roll, pitch, yaw);
	return yaw;
}

#endif