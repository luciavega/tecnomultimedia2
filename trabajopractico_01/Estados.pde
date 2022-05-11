class Estado {
  Paleta paleta;
  GestorDeInteraccion g;
  Trazo t;
  ArrayList<Trazo> ts;
  ArrayList<Linea> ls;
  String estado;
  boolean estadoInicial, estadoInactivo;
  int contadorlineas, contadormovimiento, contadorinactivo;

  Estado(Paleta paleta) {
    this.paleta = paleta;
    t = new Trazo(paleta, 0);
    ts = new ArrayList<Trazo>();
    ls = new ArrayList<Linea>();
    g = new GestorDeInteraccion();
    saltarAlEstado("inicial");
    contadorlineas = 0;
    contadormovimiento = 0;
    contadorinactivo = 0;
  }
  // ----- LÓGICA DE ESTADOS
  void actualizar(PGraphics graficotrazos, PGraphics graficolineas) {
    g.actualizar();
    // ----- Estado "INICIAL": dibujo los trazos por defecto
    if (estado.equals("inicial")) {
      estadoInactivo = false;
      p.dibujarUnFondo();
      dibujarTrazos(graficotrazos);
      if (g.hayMovimiento) { // Si se detecta movimiento y pasan X segundos desde que se mueve el mouse, se cambia de estado
        contadormovimiento++;
        int limiteCM = 10;
        if (contadormovimiento > limiteCM) {
          saltarAlEstado("actividad");
          contadormovimiento = 0;
        }
      }
    } else if (estado.equals("actividad")) {
      p.dibujarUnFondo();
      dibujarTrazos(graficotrazos);
      dibujarLineas(graficolineas);
      estadoInactivo();
    } else if (estado.equals("inactividad")) {
      graficolineas.background(252, 252, 250, 10);
      graficotrazos.background(252, 252, 250, 10);
      for (int i = ls.size()-1; i >= 0; i--) {
        ls.remove(i);
      }
      if (g.hayMovimiento) {
        saltarAlEstado("inicial");
      }
    }
  }
  // ----- CAMBIAR DE ESTADO
  void saltarAlEstado( String nuevoEstado ) {
    estado = nuevoEstado;
  }
  void estadoInactivo() {
    if (g.noHayMovimiento) {
      contadorinactivo ++;
      if (contadorinactivo > 200) {
        estadoInactivo = true;
        contadorinactivo = 0;
        if (estadoInactivo) {
          saltarAlEstado("inactividad");
          contadorinactivo = 0;
        }
      }
    } else {
      contadorinactivo = 0;
      estadoInactivo = false;
    }
  }
  // ----- LÍNEAS
  void dibujarLineas(PGraphics graficolineas) {
    estadoInactivo = false;
    if (g.movGrande) {
      contadorlineas++;
      if (contadorlineas == 90) {
        ls.add(new Linea(paleta, int(random(7)), mouseX, mouseY));
        contadorlineas = 0;
      }
    }
    for (Linea l : ls) {
      l.dibujar(graficolineas);
    }
  }
  // ----- TRAZOS
  void dibujarTrazos(PGraphics graficotrazos) {
    float valorX1 = 315;
    float valorX2 = 630;
    float valorX3 = 950;
    if (mouseX > 0 && mouseX < valorX1) {
      trazosPorFrame(graficotrazos, 30);
    } else if (mouseX > valorX2 && mouseX < valorX3 ) {
      trazosPorFrame(graficotrazos, 2);
    } else {
      trazosPorFrame(graficotrazos, 10);
    }
  }
  void trazosPorFrame(PGraphics graficotrazos, float frame) {
    if (frameCount%frame == 0) {
      t.dibujar(graficotrazos);
    }
  }
}
