# manipulator_controller_cpp: pacote que faz a cinematica inversa do braço

## Nodos ROS
- hand_setpoint_node: recebe uma mensagem Point pelo tópico /arm_setpoint e publica ângulos do braço pra chegar nesse ponto
- hand_setpoint_publisher_node: publica uma mensagem Point no tópico /arm_setpoint. Pode definir um novo ponto ao apertar espaço

## Parâmetros (config/parameters.yaml)
- Comprimentos de cada parte do braço 
  -  length_OMB 
  -  length_COT
  -  length_PUN
- Correções angulares para cada parte do braço
  - correction_OMB
  - correction_COT
  - correction_PUN

## Como utilizar o pacote
- Pré-requisitos
  - colar o custom_msg na pasta do workspace/src (https://github.com/UtBot-UTFPR/custom_msg) 
- clonar o manipulator_controller_cpp na pasta do workspace/src
- rodar a launchfile exemplo
  >> $ roslaunch manipulator_controller_cpp setpoint.launch 
