#include <ros.h>
#include <std_msgs/Empty.h>

//Definições para manipular os motores mais facilmente.
#define PARAR               0
#define HOR                +1
#define ANTHOR             -1
//Definição de cada motor para facilitar a manipulação.
#define MOTOR_OMB           0
#define MOTOR_COT           1
//Pinos de acionamento dos motores.
#define PONTE_OMB_A         4
#define PONTE_OMB_B         9
#define PONTE_COT_A         7
#define PONTE_COT_B         8
//Pinos de PWM dos motores.
#define PIN_PWM_OMB         6
#define PIN_PWM_COT         5

int toggle = -1;
long counter_max = 1200;

ros::NodeHandle nh;

void messageCb( const std_msgs::Empty& toggle_msg){
  digitalWrite(LED_BUILTIN, HIGH-digitalRead(LED_BUILTIN)); //blink the led
  toggle *= -1;
  long start = millis();
  while(millis() - start < counter_max){
    motorGo(MOTOR_OMB, HOR, 20);
    motorGo(MOTOR_COT, toggle, 170 - toggle * 50);
  }
  motorGo(MOTOR_OMB, HOR, 20);
  motorGo(MOTOR_COT, ANTHOR, 40);
}

ros::Subscriber<std_msgs::Empty> sub("toggle_led", &messageCb );

void motorGo(int motor, int dir, int pwm){
  int ponte_A = 0;
  int ponte_B = 0;
  int state_A = 0;
  int state_B = 0;
  int pin_PWM = 0;
  switch (motor){
  case MOTOR_OMB:
    ponte_A = PONTE_OMB_A;
    ponte_B = PONTE_OMB_B;
    pin_PWM = PIN_PWM_OMB;
  break;
  case MOTOR_COT:
    ponte_A = PONTE_COT_A;
    ponte_B = PONTE_COT_B;
    pin_PWM = PIN_PWM_COT;
  break;
  }
  switch (dir){
    case HOR: 
      state_A = HIGH;
      state_B = LOW;
    break;
    case ANTHOR:
      state_A = LOW;
      state_B = HIGH;
    break;
    case PARAR:
      state_A = LOW;
      state_B = LOW;
    break;
  }
  analogWrite(pin_PWM, pwm);
  digitalWrite(ponte_A, state_A);
  digitalWrite(ponte_B, state_B);
}

void setup(){
  //Pinos que mandam comando para as pontes são saídas.
  pinMode(PONTE_OMB_A, OUTPUT);
  pinMode(PONTE_OMB_B, OUTPUT);
  pinMode(PONTE_COT_A, OUTPUT);
  pinMode(PONTE_COT_B, OUTPUT);
  //Pinos que mandam o PWM são saídas.
  pinMode(PIN_PWM_OMB, OUTPUT);
  pinMode(PIN_PWM_COT, OUTPUT);

  pinMode(LED_BUILTIN, OUTPUT);
  nh.initNode();
  nh.subscribe(sub);
}

void loop(){
  nh.spinOnce();
  delay(1);
}