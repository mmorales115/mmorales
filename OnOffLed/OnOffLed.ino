const int ledpin = 13;      //Definir el pin del LED

void setup() {
  // put your setup code here, to run once:

  pinMode(13, OUTPUT);    //El número del pin y definir si es de entrada o salida
  Serial.begin(9600);     // Comenzar la comunicación serial
}

void loop() {
  // put your main code here, to run repeatedly:
  if (Serial.available() > 0) {           //Si alguna información está disponible en el puerto serial
    char ledPinState = Serial.read();     //Leer el dato
    if (ledPinState == '1') {             //Si la declaración es verdadera (1)
      digitalWrite (ledpin, HIGH);        //Encender el Led
    }
    if (ledPinState == '0') {             //Si la declaración es falsa (0)
      digitalWrite (ledpin, LOW);         //Apagar el Led
    }

  }
}
