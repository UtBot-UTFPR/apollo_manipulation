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
#include <custom_msg/status_arm.h>
#include <custom_msg/set_angles.h>
#include <std_msgs/String.h>
#include <unistd.h>
#include <iostream>

// *** MENSAGENS RECEBIDAS ***
std_msgs::String voice_command;

// *** MENSAGENS PUBLICADAS ***
custom_msg::set_angles  msg_set_angles;

// *** FUNÇÕES ***
void callback_voice(const std_msgs::String msg);

// *** MAIN ***
int main(int argc, char **argv)
{

	// INICIALIZAÇÃO DO NODO
	ros::init(argc, argv, "claw_controller");
	ros::NodeHandle n;

	// PARÂMETROS
	bool   debug          = false; // Habilita log de debug
    bool   incline        = true;            //   define o uso de scoop ou grab, mediante visao

	if (debug == true)
		ros::console::set_logger_level(ROSCONSOLE_DEFAULT_NAME, ros::console::levels::Debug);

	// SUBSCRIBERS
	ros::Subscriber sub_voice_command = n.subscribe("/text_recognized", 1, callback_voice);

	// PUBLISHERS
	ros::Publisher pub_set_angles 	= n.advertise<custom_msg::set_angles>("/cmd_3R", 0);

	// VARIÁVEIS DE TEMPO
	ros::Rate loopRate(30);
	
	// LOOP PRINCIPAL
	while (ros::ok()) {

		loopRate.sleep();
		ros::spinOnce();
		
		if (voice_command.data.compare(std::string("Hold")) == 0) {
			sleep(1);
            ROS_INFO("Closing gripper!");
			msg_set_angles.set_GAR = 180.0;
            pub_set_angles.publish(msg_set_angles);
		}
        else if (voice_command.data.compare(std::string("Stop")) == 0){
			sleep(2);
            ROS_INFO("Opening gripper!");
			msg_set_angles.set_GAR = 120.0;
            pub_set_angles.publish(msg_set_angles);
		}
	}
	return 0;
}

void callback_voice(const std_msgs::String msg)
{
	voice_command = msg;
}
