- # manipulator_controller_cpp: pacote que faz a cinematica inversa do braço

  - ## Nodos ROS
    - ### xz_controller_node
      - Recebe: mensagem Point
      - Publica: ângulos do braço pra chegar nesse ponto (no plano xz)
    - ### xy_controller_node
      - Recebe: mensagem Point
      - Publica: comando de velocidade pro robô girar em torno do eixo z (yaw - ajustes no plano xy)
    - ### setpoint_publisher_node 
      - Publica: mensagem Point (pode definir um novo ponto ao apertar espaço)
    
  - ## Definições
    ```yaml
    OMB: ombro
    COT: cotovelo
    PUN: punho
    GAR: garra
    ```

  - ## Parâmetros (config/parameters.yaml)
    ```yaml
    # Comprimentos de cada parte do braço
    length_OMB 
    length_COT
    length_PUN
    # Correções angulares para cada parte do braço
    correction_OMB
    correction_COT
    correction_PUN
    # Determina um ângulo aceitável para o ajuste angular em torno do eixo z
    yaw_acceptable_error
    # Constante de proporcionalidade do PID do ajuste angular em torno do eixo z
    Kp
    # Se true, vai mostrar mais detalhes no log
    debug
    ```

  - ## Como utilizar o pacote
    - Pré-requisitos (clonar repositórios e compilar)
      ```bash
      cd catkin_ws/src
      # Clonar o custom_msg
      git clone https://github.com/UtBot-UTFPR/custom_msg
      # Clonar a stack de manipulação
      git clone https://github.com/UtBotsAtHome-UTFPR/utbots_manipulation.git
      cd ..
      catkin_make
      ```
    - Rodar as launchfiles
      ```bash
      roslaunch manipulator_controller_cpp setpoint_xy.launch # apenas para xy
      roslaunch manipulator_controller_cpp setpoint_xz.launch # apenas para xz
      roslaunch manipulator_controller_cpp setpoint_xyz.launch # executa os 2 pacotes (xy e xz)
      ```
