# manipulator_controller_cpp: pacote que faz a cinematica inversa do braço

## Nodos ROS
- hand_setpoint_node: recebe uma mensagem Point pelo tópico /arm_setpoint e publica ângulos do braço pra chegar nesse ponto
- hand_setpoint_publisher_node: publica uma mensagem Point no tópico /arm_setpoint. Pode definir um novo ponto ao apertar espaço

## Parâmetros (config/parameters.yaml)
- Comprimentos de cada parte do braço 
  -  length_OMB 
  -  length_COT
  -  length_PUN)
- Correções angulares para cada parte do braço
  - correction_OMB
  - correction_COT
  - correction_PUN)

## Pré-requisitos
- custom_msg (colar na pasta do workspace/src) 
  > https://github.com/UtBot-UTFPR/custom_msg

## Como rodar
- clonar o repositório na pasta do workspace/src
- launchfile exemplo em launch/setpoint.launch
  > $ roslaunch manipulator_controller_cpp setpoint.launch 
