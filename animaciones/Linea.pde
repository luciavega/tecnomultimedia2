class Linea {
  float x, y;
  
  int maxImages, imageIndex;
  PImage [] images;
  color colorTinte;

  Linea(float x, float y, int maxImages) { // -- Paso como parámetro la posición en X, en Y y la dimensión del arreglo
    this.x = x;
    this.y = y;
    this.maxImages = maxImages;
    
    images = new PImage[maxImages];
    imageIndex = 0;

    for (int i = 0; i < images.length; i++) {
      String nombre = "linea" + nf(i, 2) + ".png";
      images[i] = loadImage ( nombre );
    }

    colorTinte = color(random(255), random(255), random(255));
  }

  void dibujar() {
    pushStyle();
    pushMatrix();

    tint(colorTinte);
    frameRate(14);
    image(images[imageIndex], 0, 0);
    // --- Varía el índice de la imagen que se muestra así se genera el efecto gif
    imageIndex = (imageIndex+1) % images.length;

    popMatrix();
    popStyle();
  }
}
