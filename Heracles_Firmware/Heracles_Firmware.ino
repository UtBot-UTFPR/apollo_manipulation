#include <AccelStepper.h>
/*#include <Servo.h>

#include <ros.h>
#include <custom_msg/set_angles.h>
#include <custom_msg/status_arm.h>*/

//Received values:
long degreeBAS = 30;
long degreeOMB = 30;
long degreeCOT = 30;
long degreePUL = 30;
long degreeALL[] = { degreeBAS, degreeOMB, degreeCOT, degreePUL };

//Sended values:
bool done = false;

//Internal values:
bool clutching = false;
bool returning = false;
long timeStart = 0;
#define TIMEWAIT 2000

AccelStepper motorBAS(1, 26, 28); //E0
AccelStepper motorOMB(1, 46, 48); //Z
AccelStepper motorCOT(1, 60, 61); //Y
AccelStepper motorPUL(1, 54, 55); //X

struct stepMotor{
  AccelStepper* motor;
  int pinEndstop;
  int pinEnable;
  int pinStep;
  int pinDirection;
};

stepMotor BAS = { &motorBAS, 02, 24, 26, 28 };
stepMotor OMB = { &motorOMB, 18, 62, 46, 48 };
stepMotor COT = { &motorCOT, 14, 56, 60, 61 };
stepMotor PUL = { &motorPUL, 03, 38, 54, 55 };

stepMotor motors[] = { BAS, OMB, COT, PUL };

#define FACTOR 80
long degreeToStep(long degree){ return (degree * (3200.0 / 360.0) * FACTOR); }
long stepToDegree(long step){ return (step * (360.0 / 3200.0) / FACTOR); }

bool moveToSingle(int index){
  float priorSpeed = motors[index].motor->speed();
  if (!motors[index].motor->distanceToGo()) motors[index].motor->moveTo(degreeToStep(degreeALL[index])); //Se o motor não tem um destino definido, defina-o.
  if (!digitalRead(motors[index].pinEndstop)) {
    motors[index].motor->stop();
    motors[index].motor->setCurrentPosition(0);
    degreeALL[index] = 0;
  }
  else motors[index].motor->run();  //Se o endstop não é apertado, o motor se move.
  if (abs(priorSpeed) >= abs(motors[index].motor->speed()) && !motors[index].motor->distanceToGo()) return true; //Se o motor desacelerou e parou, retorna TRUE.
  return false;
}

bool moveToAll() {
  bool flag = true;
  for (int i=0; i<4; i++) flag *= moveToSingle(i); //Se um dos motores está a se mover, retorna FALSE.
  return flag;
}

bool resetAll() {
  for (int i=0; i<4; i++) if (degreeALL[i] > 0) degreeALL[i] = 0;
  if (moveToAll()) return true; //Se o motor parou, retorna TRUE.
  return false;
}

void setup() 
{ 
  Serial.begin(9600);

  for (int i=0; i<4; i++){
    pinMode(motors[i].pinEndstop, OUTPUT);
    pinMode(motors[i].pinEnable, OUTPUT);
    digitalWrite(motors[i].pinEnable, LOW);

    motors[i].motor->setCurrentPosition(0);
    motors[i].motor->setMaxSpeed(6000);
    motors[i].motor->setAcceleration(2000.0);
  }

  timeStart = millis();
}

int aux = 0;

void loop() {
  switch(aux){
    case 0:
      for (int i=0; i<4; i++) degreeALL[i] = 30;
    break;
    case 1:
      for (int i=0; i<4; i++) degreeALL[i] = 30;
    default:
      aux = 0;
    break;
  }
  //Serial.print(aux); Serial.print(", ");
  int flag_1 = true;
  for (int i=0; i<4; i++) flag_1 += abs(motors[i].motor->distanceToGo());
  if (flag_1 > 0 && !returning) done = false;
  
  if (true) {
    bool not_endstopping = true;
    for (int i=0; i<4; i++) not_endstopping *= digitalRead(motors[i].pinEndstop);
    if (returning) {
      //Serial.print("BCK, ");
      if (resetAll()) { //Se o braço voltou à posição inicial.
        //Serial.print("RTED, ");
        for (int i=0; i<4; i++) degreeALL[i] = 0;
        if (millis() - timeStart > TIMEWAIT / 2) clutching = !clutching;
        if (millis() - timeStart > TIMEWAIT) returning = false;
      } //else Serial.print("RING, ");
      if (!returning) {
        bool flag_2 = true;
        for (int i=0; i<4; i++) flag_2 *= digitalRead(motors[i].pinEndstop);
        while (!flag_2) {
          flag_2 = true;
          for (int i=0; i<4; i++) {
            motors[i].motor->moveTo(degreeToStep(1));
            motors[i].motor->run();
            flag_2 *= digitalRead(motors[i].pinEndstop);
          }
        }
        for (int i=0; i<4; i++) motors[i].motor->setCurrentPosition(0);
        done = true;
        aux++;
      }
    } else {
      //Serial.print("FWD, ");
      if (moveToAll()) { //Se o braço chegou na posição final.
        //Serial.print("MVED, ");
        if (millis() - timeStart > TIMEWAIT / 2) clutching = !clutching;
        if (millis() - timeStart > TIMEWAIT) returning = true;
      } else {
        //Serial.print("MING, ");
        timeStart = millis(); //Isso executará pela última vez logo antes dos motores pararem.
      }
    }
  }
  //Serial.println(done);
  /*Serial.print(stepToDegree(motors[0].motor->distanceToGo())); Serial.print(", ");
  Serial.print(stepToDegree(motors[1].motor->distanceToGo())); Serial.print(", ");
  Serial.print(stepToDegree(motors[2].motor->distanceToGo())); Serial.print(", ");
  Serial.println(stepToDegree(motors[3].motor->distanceToGo()));*/
}
