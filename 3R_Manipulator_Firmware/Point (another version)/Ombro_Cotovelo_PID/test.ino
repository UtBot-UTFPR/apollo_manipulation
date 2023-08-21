/* 
 * rosserial Subscriber Example
 * Blinks an LED on callback
 */

#include <ros.h>
#include <std_msgs/Empty.h>

ros::NodeHandle  nh;

void messageCb( const std_msgs::Empty& toggle_msg){
  digitalWrite(LED_BUILTIN, HIGH-digitalRead(LED_BUILTIN));   // blink the led
}

ros::Subscriber<std_msgs::Empty> sub("toggle_led", &messageCb );

void setup()
{
  pinMode(LED_BUILTIN, OUTPUT);
  nh.initNode();
  nh.subscribe(sub);
}

void loop()
{
  int s = 1000;
  nh.spinOnce();
  delay(1);
  if(nh.connected()){
    s *= 5;
  }
  digitalWrite(LED_BUILTIN, HIGH);
  delay(s);
  digitalWrite(LED_BUILTIN, LOW);
  delay(s);
}