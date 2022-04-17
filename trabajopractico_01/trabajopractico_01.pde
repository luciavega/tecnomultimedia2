Trazos trazos;
Paleta paleta;

void setup(){
   size(1000, 900); 
   imageMode( CENTER );
   trazos = new Trazos("trazo", 15); // Pasamos x parámetro el tipo de imagen (trazo, linea, garabato) y la cantidad 
   paleta = new Paleta("eduardo_p1.png");
   background( #FFFBF5 );
}

void draw(){
  trazos.dibujar(paleta.darUnColor());
}
