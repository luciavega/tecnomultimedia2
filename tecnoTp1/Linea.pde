class Linea {
  // ---- Posición, cantidad y selección de imagen
  float x, y;
  int cantidad, cual;
  // ---- Objeto Paleta, color de los trazos y alfa 
  Paleta p;
  color colorRelleno;
  float alfa;
  // ---- Imágenes
  PImage [] lineas;
  PImage mascara;

  Linea(Paleta p, float x, float y, float alfa, int cual) {
    this.x = x;
    this.y = y;
    this.p = p;
    this.alfa = alfa;
    this.cual = cual;
    cantidad = 16;
    lineas = new PImage[cantidad];
    for (int i = 0; i < cantidad; i++) {
      String nombre = "linea" + nf(i, 2) + ".png";
      mascara = loadImage( nombre );
      mascara.filter( INVERT );
      lineas[i] = createImage( 300, 300, RGB );
      lineas[i].filter( INVERT );
      lineas[i].mask( mascara );
    }
    colorRelleno = p.darUnColor();
  }

  void dibujar() {
    pushMatrix();
    pushStyle();
    imageMode(CENTER);
    tint(colorRelleno, alfa);
    translate( x, y );
    image(lineas[cual], 0, 0);
    popMatrix();
    popStyle();
  }
}
