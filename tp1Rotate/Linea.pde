class Linea {
  // ---- Posición, cantidad y selección de imagen
  float x, y, angulo, escala;
  int cantidad, cual;
  // ---- Objeto Paleta, color de los trazos y alfa 
  Paleta p;
  color colorRelleno;
  float alfa;
  // ---- Imágenes
  PImage [] lineas;
  PImage mascara;
  // ---- Movimiento
  float vel;
  float dir;
  float variacionAngular;

  Linea(Paleta p, float x, float y, float alfa, int cual) {
    this.x = x;
    this.y = y;
    this.p = p;
    this.alfa = alfa;
    this.cual = cual;
    cantidad = 15;
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
    angulo = radians(random(0.5, 2));
    escala = random(0.8, 1.1);
    vel = 2;
    dir = radians( random(360) );
    variacionAngular = 0;
  }
  void dibujar() {
    pushMatrix();
    pushStyle();
    imageMode(CENTER);
    tint(colorRelleno, alfa);
    translate( x, y );
    rotate ( angulo );
    //scale(0.8);
    image(lineas[cual], 0, 0);
    popMatrix();
    popStyle();
  }
  void mover() {
    dir = dir + variacionAngular;
    //transformación de polares a cartesianas
    float dx = vel * cos( dir );
    float dy = vel * sin( dir );
    //cartesianas
    x = x + dx;
    y = y + dy;
    rebotes();
  }
  void rebotes() {
    if (x>=width) {
      dir = 180;
    }
    if (x<=0) {
      dir = 0;
    }
    if (y>=height) {
      dir = 270;
    }
    if (y<=0) {
      dir = 90;
    }
  }
}
