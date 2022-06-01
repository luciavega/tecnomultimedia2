class Trazo {
  // ---- Posición, cantidad y selección de imagen
  float x, y, angulo, escala;
  int cantidad, cual;
  // ---- Objeto Paleta, color de los trazos y alfa 
  Paleta p;
  color colorRelleno;
  float alfa;
  // ---- Imágenes
  PImage [] trazos;
  PImage mascara;

  Trazo(Paleta p, float x, float y, float alfa, int cual) {
    this.x = x;
    this.y = y;
    this.p = p;
    this.alfa = alfa;
    this.cual = cual;
    cantidad = 26;
    trazos = new PImage[cantidad];
    for (int i = 0; i < cantidad; i++) {
      String nombre = "trazo" + nf(i, 2) + ".png";
      mascara = loadImage( nombre );
      mascara.filter( INVERT );
      trazos[i] = createImage( 500, 500, RGB );
      trazos[i].filter( INVERT );
      trazos[i].mask( mascara );
    }
    colorRelleno = p.darUnColor();
    angulo = radians(random(0.5, 2));
    escala = random(0.8, 1.1);
  }
  // ---- Método para dibujar los trazos con la voz
  void dibujar() {
    pushStyle();
    pushMatrix();
    imageMode(CENTER);
    tint(colorRelleno, alfa);
    translate( x, y );
    rotate ( angulo );
    scale(0.8);
    image(trazos[cual], 0, 0);
    popMatrix();
    popStyle();
  }
  // ---- Método para dibujar el fondo
  void dibujarFondo(PGraphics g) {
    g.pushMatrix();
    g.imageMode(CENTER);
    g.tint(colorRelleno, alfa);
    g.translate( x, y );
    float angulo = radians(map( x, 0, width, 45, 190 ));
    g.rotate ( angulo );
    g.scale(escala);
    g.image(trazos[cual], 0, 0);
    g.popMatrix();
  }
}
