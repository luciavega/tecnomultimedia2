

class Trazos{
  PImage trazos[];
  PImage mascara;
  int cantidad;
  
  Trazos(String nombre_img){
   cantidad = 15;
   trazos = new PImage[ cantidad ];
   
   for(int i=0; i<cantidad; i++){
    String nombre = nombre_img +nf(i,2)+".png";
    mascara = loadImage( nombre );
    mascara.filter( INVERT );
    trazos[i] = createImage( 300  , 300  , RGB);
    trazos[i].filter( INVERT );
    trazos[i].mask( mascara );
   }
  }
  
  void dibujar(color paleta){
  for(int i =0; i < 2; i++){
    int cual = int(random( cantidad ));
    float x = random( width );
    float y = random( height );
    frameRate(4);
    tint( paleta );
    pushMatrix();
    translate(x, y);
    //scale( random(0.2 , 0.5) );
    image(trazos[cual], 0, 0);
    popMatrix();
    }
  }
  
}
