

class Trazos {
  PImage trazos2[];
  PImage trazos[];
  PImage mascara;
  int cantidad;
  int transparencia=0;

  Trazos(String nombre_img, int cantidad) {
    this.cantidad = cantidad;
    trazos = new PImage[ cantidad ];

    for (int i=0; i<cantidad; i++) {
      String nombre = nombre_img +nf(i, 2)+".png";
      mascara = loadImage( nombre );
      mascara.filter( INVERT );
      trazos[i] = createImage( 300, 300, RGB);
      trazos[i].filter( INVERT );
      trazos[i].mask( mascara );
    }
  }

  void dibujar(color paleta, boolean transparenciaa) { //boolean para que se aplique o no la transparencia
    for (int i =0; i < 2; i++) {
      int cual = int(random( cantidad ));
      float x = random( width );
      float y = random( height );
      frameRate(4);
      if (pmouseY>mouseY && transparenciaa==true) { //si sube el mouse= + saturación
        map(transparencia, 0, height, 0, 360);
        transparencia+=5;
        tint(255, transparencia);
      } else if (pmouseY<mouseY) {//si baja el, mouse - saturación
        transparencia-=5;
      } else if (transparenciaa==false) {
        transparencia=255;
      }
      println(transparencia);

      tint( paleta, transparencia);
      pushMatrix();
      translate(x, y);
      image(trazos[cual], 0, 0);
      popMatrix();
    }
  }
}
