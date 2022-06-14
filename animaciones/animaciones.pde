Linea l;

void setup() {
  size(800, 800);
  l = new Linea(random(width), random(height), 12), "linea";
}

void draw() {
  background(0);
  fill(255, 180, 200);
  l.dibujar();
}
