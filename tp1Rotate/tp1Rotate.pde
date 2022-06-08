// ---- Importar la librería oscP5
import oscP5.*;

Sonido s;

ArrayList<Trazo> tf, t;
void setup() {
  size(1000, 950, P2D);
  s = new Sonido();  
}

void draw() {
  background(250, 250, 255);
  s.actualizar();
}
