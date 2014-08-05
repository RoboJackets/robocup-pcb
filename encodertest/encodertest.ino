//channel a goes to 10 
//channel b goes to 8
int cha = 10;
int chb = 8;
int led = 13;
unsigned long up;
unsigned long down;
unsigned long ratio;
boolean atrue;
void setup()
{
  pinMode(cha,INPUT);
  pinMode(chb,INPUT);
  pinMode(led,OUTPUT);
  Serial.begin(9600);
}
void loop()
{
  up = pulseIn(cha,HIGH);
  down = pulseIn(cha,LOW);
  Serial.print("up A: ");
  Serial.println(up);
  Serial.print("down A:");
  Serial.println(down);
  ratio = up/down;
  if ((ratio > .95) && (ratio < 1.05)){
    atrue = true;
  }else{
    atrue = false;
  }
  up = pulseIn(chb,HIGH);
  down = pulseIn(chb,LOW);
  Serial.print("Up b: ");
  Serial.println(up);
  Serial.print("Down b: ");
  Serial.println(down);
  ratio = up/down;
  if (((ratio > .95) && (ratio < 1.05)) && (atrue == true)){
    digitalWrite(led, HIGH);
  }else{
    digitalWrite(led, LOW);
  }
}
