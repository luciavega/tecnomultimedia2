
class Trazo {
  PImage [] trazos;
  int cantTrazos, cual;
  float xf, yf;
  color colorTinte;
  Paleta paletaTrazos;

  Trazo(Paleta paletaTrazos, int cual) {
    this.paletaTrazos = paletaTrazos;
    xf = random(width);
    yf = random(height);
    this.cual = cual;
    colorTinte = paletaTrazos.darUnColor();
    cargarTrazos();
  }
  void cargarTrazos() {
    cantTrazos = 15;
    trazos = new PImage[cantTrazos];
    for (int i = 0; i < cantTrazos; i++) {
      String nombre = "trazo" + nf(i, 2) + ".png";
      trazos[i] = loadImage( nombre );
    }
  }
  // ----- Estilos y propiedades del trazo
  void dibujar(PGraphics grafico) {
    float x = random (width);
    float y = random (height);
    int elegida = int(random(cantTrazos));
    grafico.push();
    grafico.tint(paletaTrazos.darUnColor());
    grafico.scale(random(0.8, 1.4));
    grafico.rotate(random(0, 1.5));
    grafico.imageMode( CENTER );
    grafico.image(trazos[elegida], x, y);
    grafico.pop();
  }
  // ----- Método en el que calcula el módulo del frameCount por un parámetro ingresado. Dependiendo de ese resultado es la cantidad de imágenes que aparecen por frame
  void dibujarCapa(PGraphics grafico, float frame) {
    if (frameCount%frame == 0) {
      dibujar(grafico);
    }
  }
}
