- # manipulator_controller_cpp: pacote que faz a cinematica inversa do braço

  - ## Nodos ROS
    - xz_controller_node: 
      - Recebe: mensagem Point
      - Publica: ângulos do braço pra chegar nesse ponto (no plano xz)
    - xy_controller_node: 
      - Recebe: mensagem Point
      - Publica: comando de velocidade pro robô girar em torno do eixo z (yaw - ajustes no plano xy)
    - setpoint_publisher_node: 
      - Publica: mensagem Point (pode definir um novo ponto ao apertar espaço)
    
  - ## Definições
    ```
    - OMB: ombro
    - COT: cotovelo
    - PUN: punho
    - GAR: garra
    ```

  - ## Parâmetros (config/parameters.yaml)
    - Comprimentos de cada parte do braço 
      -  length_OMB 
      -  length_COT
      -  length_PUN
    - Correções angulares para cada parte do braço
      - correction_OMB
      - correction_COT
      - correction_PUN
    - yaw_acceptable_error (determina um ângulo aceitável para a rotação do robô)
    - Kp (constante de proporcionalidade do PID da rotação do robô)
    - debug (se true, vai mostrar mais detalhes no log)

  - ## Como utilizar o pacote
    - Pré-requisitos
      - colar o custom_msg na pasta do workspace/src (https://github.com/UtBot-UTFPR/custom_msg) 
    - clonar o manipulator_controller_cpp na pasta do workspace/src
    - rodar as launchfiles:
      - ```$ roslaunch manipulator_controller_cpp setpoint_xy.launch```
      - ```$ roslaunch manipulator_controller_cpp setpoint_xz.launch```
      - ```$ roslaunch manipulator_controller_cpp setpoint_xyz.launch```
