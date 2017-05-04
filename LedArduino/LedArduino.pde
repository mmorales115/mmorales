import processing.serial.*;        //Importa desde la libreria para una comunicación serial 

Serial myPort;                     //Define el nombre de comunicación serial 


int s = 0;                        //Declarar variables de tipo entero para los segundos del cronómetro 
int m = 0; 
void setup() {                    // Establecer na resolución para nuestra ventana 
  size(500, 500);                 // Tamaño de la ventana en pixeles 

  myPort = new Serial (this, "COM3", 9600); //Nombre del puerto de comunicación de nuestro Arduino
}

void draw () {                  //Dibujar una función
  background(0);                //Color del fondo
  textAlign(CENTER);            //La ubicación del texto 
  textSize(30);                 // El tamaño del texto en puntos 
  delay(1000);                  //Comienza luego de un segundo (en processing se trabaja con milisegundos)
  if (s <= 59) {                // los segundos llegan hasta 59 
    text(m + " : " + s, width/2, height/2); //mostrar el cronómetro y su ubicación en la pantalla 
    s = s + 1;                 // por cada segundo que pase se le suma uno 
    myPort.write ('1');        // en Arduino nuestro led está prendido cuando está en 1
  } 
  if (s == 10) {                //Si el cronómetro llega a 30 segundos el led se apaga 
    myPort.write ('0');
  }
}