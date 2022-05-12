/*
  ----- En este objeto se cargan las imágenes de trazos finos o garabatos.
*/

class Linea {
  PImage [] lineas;
  int cantidad, cual; 
  float x, y, tam;
  Paleta paleta;
  color colorRelleno;
  // ----- Por parámetro pasamos la paleta, la imagen que se va a estar mostrando ([0], [1], [2]...) y la posición en x e y.
  Linea(Paleta paleta, int cual, float x, float y) { 
    this.paleta = paleta;
    this.cual = cual;
    this.x = x;
    this.y = y;
    cargaImagenes();
    colorRelleno = paleta.darColorTrazos();
  }
  // ----- MÉTODOS
  void cargaImagenes() {
    cantidad = 7;
    lineas = new PImage [cantidad];
    for (int i = 0; i < cantidad; i++) {
      String nombre = "linea" + nf(i, 2) + ".png";
      lineas[i] = loadImage( nombre );
    }
  }
  void dibujar(PGraphics grafico) {
    grafico.tint(colorRelleno);
    grafico.image(lineas[cual], x, y);
  }
}
