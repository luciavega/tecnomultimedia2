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
  // ---- Movimiento
  float vel;
  float dir;
  float variacionAngular;

  Trazo(float x, float y, Paleta p, float alfa, int cual) {
    this.x = x;
    this.y = y;
    this.p = p;
    this.alfa = alfa;
    this.cual = cual;
    cantidad = 18;
    trazos = new PImage[cantidad];
    for (int i = 0; i < cantidad; i++) {
      String nombre = "trazo" + nf(i, 2) + ".png";
      mascara = loadImage( nombre );
      mascara.filter( INVERT );
      trazos[i] = createImage( 300, 300, RGB );
      trazos[i].filter( INVERT );
      trazos[i].mask( mascara );
    }
    colorRelleno = p.darUnColor();
    angulo = radians(random(0.5, 5));
    escala = random(0.9, 1.5);
    vel = 2;
    dir = radians( random(360) );
    variacionAngular = 0;
  }

  void dibujar() {
    pushStyle();
    pushMatrix();
    imageMode(CENTER);
    tint(colorRelleno, alfa);
    translate( x, y );
    rotate ( angulo );
    scale(escala);
    image(trazos[cual], 0, 0);
    popMatrix();
    popStyle();
resetMatrix();  
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
   angulo = radians(random(360));  
  }
    if (x<=0) {
      dir = 0;
   angulo = radians(random(360));  
  }
    if (y>=height) {
      dir = 270;
   angulo = radians(random(360));  
  }
    if (y<=0) {
      dir = 90;
   angulo = radians(random(5, 10));  
  }
  }
}
