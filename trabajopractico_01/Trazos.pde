

class Trazos {
  PImage [] trazos;
  PImage mascara;
  int cantidad;
  float opacidad;
  
  Trazos(String nombre_img, int cantidad) {
    this.cantidad = cantidad;
    trazos = new PImage[ cantidad ];
    for (int i=0; i<cantidad; i++) {
      String nombre = nombre_img +nf(i, 2)+".png";
      mascara = loadImage( nombre );
      mascara.filter( INVERT );
      trazos[i] = createImage( 300, 300, HSB);
      trazos[i].filter( INVERT );
      trazos[i].mask( mascara );
    }
    opacidad = 5;
  }

  void dibujar(color paleta) {
    for (int i =0; i < 1; i++) {
      int cual = int(random( cantidad ));
      float x = random( width );
      float y = random( height );
      frameRate(5);
      tint( paleta , opacidad );
      pushMatrix();
      translate(x, y);
      image(trazos[cual], 0, 0);
      popMatrix();
    }
  }
}
