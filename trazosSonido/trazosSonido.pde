import oscP5.*;
duracionTrazos t;
//Trazos trazos;
//Trazos trazos2;
Paleta paleta;
Paleta paleta2;


void setup() {
  size(1000, 900);
  imageMode( CENTER );
 // trazos = new Trazos("trazo", 15); // Pasamos x parámetro el tipo de imagen (trazo, linea, garabato) y la cantidad
 // trazos2= new Trazos("trazoo", 3);
  paleta = new Paleta("eduardo_p1.jpg");
  paleta2= new Paleta("eduardo_p2.png");
  t= new duracionTrazos(50,100,50,96,0.8); // variables calibración
  background( #FFFBF5 );
}

void draw() {
 // trazos.dibujar(paleta.darUnColor(), true);
  t.dibujar();
}

void mousePressed() {//= velocidad del mouse
 // trazos2.dibujar(paleta2.darUnColor(), false);
}
