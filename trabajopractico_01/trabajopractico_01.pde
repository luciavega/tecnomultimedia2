Paleta p;
Estado e;
Trazo [] tfondo;
PGraphics graficolineas, graficotrazos, graficofondo;

void setup() {
  size(1000, 950);
  graficofondo = createGraphics(width, height);
  graficolineas = createGraphics(width, height);
  graficotrazos = createGraphics(width, height);
  p = new Paleta(int(random(0, 4)));
  e = new Estado(p);
  p.dibujarUnFondo();
}

void draw() {

  graficotrazos.beginDraw();
  graficolineas.beginDraw();
  e.actualizar(graficotrazos, graficolineas);

  graficotrazos.endDraw();
  graficolineas.endDraw();

  image(graficotrazos, 0, 0);
  image(graficolineas, 0, 0);
}
