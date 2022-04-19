Trazos trazos;
Trazos trazos2;
Paleta paleta;
Paleta paleta2;

void setup(){
   size(1000, 900); 
   imageMode( CENTER );
   trazos = new Trazos("trazo", 15); // Pasamos x parámetro el tipo de imagen (trazo, linea, garabato) y la cantidad 
   trazos2= new Trazos("trazoo",3);
   paleta = new Paleta("eduardo_p1.jpg");
   paleta2= new Paleta("eduardo_p2.png");
   background( #FFFBF5 );

}

void draw(){
  trazos.dibujar(paleta.darUnColor(),true);
}
void mousePressed(){//= velocidad del mouse
trazos2.dibujar(paleta2.darUnColor(),false);
}
