/*
- Estado 1: Figuras grises
 - Estado 2: Figuras en color
 - Estado 3: Pocas figuras.
 - Estado 4: Muchas figuras.
 - Estado 5: Garabatos y líneas
 */


class Trazo {
  PImage [] trazos;
  PImage mascara;
  int cantidad, imagen;
  float x, y;
  color relleno;

  Trazo(color relleno) {
    x = random ( width );
    y = random ( height );
    cantidad = 15;
    imagen = int(random(0, cantidad));
    this.relleno = relleno;
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

  void dibujar() {
    tint ( relleno, 255);
    image(trazos[imagen], x, y);
  }
}
