class Paleta {

  PImage imagen;
  int posX, posY, elegida;
  color [] colorTrazos;
  PImage [] fondo;
  int cual;


  Paleta (int cual) {
    elegida = int(random(4));
    imagen = loadImage("eduardo_p0" + elegida + ".png" );
    colorTrazos = new color[8];
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
    colorTrazos[0] = color(208, 56, 44, alfa);
    colorTrazos[1] = color(25, 24, 21, alfa);
    colorTrazos[2] = color(199, 200, 202, alfa);
    colorTrazos[3] = color(28, 128, 161, alfa);
    colorTrazos[4] = color(64, 46, 30, alfa);
    colorTrazos[5] = color(18, 34, 51, alfa);
    colorTrazos[6] = color(211, 186, 39, alfa);
    colorTrazos[7] = color(167, 137, 74, alfa);

    return color(colorTrazos[int(random(8))]);
  }
  void dibujarUnFondo() {
    image(fondo[cual], 0, 0);
  }
}
