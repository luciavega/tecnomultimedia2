class Paleta {

  PImage imagen, imagenTrazo;
  int posX, posY, elegida;
  color [] colorTrazos;
  PImage [] fondo;
  int cual;


  Paleta (int cual) {
    elegida = int(random(4));
    imagen = loadImage("eduardo_p0" + elegida + ".png" );
    imagenTrazo = loadImage("eduardotrazos_p2.png");
    fondo = new PImage[4];
    this.cual = cual;
    for (int i = 0; i < 4; i++) {
      String nombre = "fondo" + nf(i, 2) + ".jpg";
      fondo[i] = loadImage( nombre );
    }
  }

  color darUnColor() {
    float alfa = 100;
    if (mouseY > 0 && mouseY < height) {
      alfa = map(mouseY, height, 0, 25, 255);
    } else {
      alfa = 100;
    }
    int posX = int( random( imagen.width ));
    int posY = int( random( imagen.height ));
    color este = imagen.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa);
  }
  color darColorTrazos() {
    float alfa = 100;
    if (mouseY > 0 && mouseY < height) {
      alfa = map(mouseY, height, 0, 25, 255);
    } else {
      alfa = 100;
    }
    int posX = int( random( imagenTrazo.width ));
    int posY = int( random( imagenTrazo.height ));
    color este = imagenTrazo.get( posX, posY );
    return color( red(este), green(este), blue(este), alfa);

  }
  void dibujarUnFondo() {
    image(fondo[cual], 0, 0);
  }
}
