Trazos trazos;
Paleta paleta;
GestorInteraccion gi;
void setup() {
  size(1000, 900);
  imageMode( CENTER );
  trazos = new Trazos("trazo", 15);
  paleta = new Paleta("eduardo_p1.png");
  background( #FFFBF5 );
  gi = new GestorInteraccion();
}

void draw() {
  trazos.dibujar(paleta.darUnColor());
  gi.actualizar();
  if (gi.arriba) {
    float miOpacidad = map(mouseY, height, 0, 0, 255);
    trazos.opacidad = miOpacidad;
    println("arriba");
  }
  
  if(gi.abajo){
    float miOpacidad = map(mouseY, 0, height, 255, 0);
    trazos.opacidad = miOpacidad;
  }
}
