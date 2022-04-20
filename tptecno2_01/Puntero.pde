
class Trazo {
  PImage [] trazos;
  PImage mascara;
  int cantidad, imagen;
  float x, y, opacidad;

  Trazo() {
    cantidad = 15;
    x = random ( width );
    y = random ( height );
    imagen = int(random(0, cantidad));
    trazos = new PImage[ cantidad ];
    for (int i=0; i<cantidad; i++) {
      String nombre = "trazo" + nf(i, 2) + ".png";
      mascara = loadImage( nombre );
      mascara.filter( INVERT );
      trazos[i] = createImage( 300, 300, HSB);
      trazos[i].filter( INVERT );
      trazos[i].mask( mascara );
    }
  }

  void dibujar(color relleno) {
    for (int i =0; i < 1; i++) {
      int cual = int(random( cantidad ));
      float x = random( width );
      float y = random( height );
      frameRate(5);
      tint( relleno , opacidad );
      pushMatrix();
      translate(x, y);
      image(trazos[cual], 0, 0);
      popMatrix();
    }
  }
}
