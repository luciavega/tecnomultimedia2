Trazos trazos;
Paleta paleta;

void setup(){
   size(1000, 900); 
   imageMode( CENTER );
   trazos = new Trazos("trazo");
   paleta = new Paleta("eduardo_p1.png");
   background( #FFFBF5 );
}

void draw(){
  trazos.dibujar(paleta.darUnColor());
}
