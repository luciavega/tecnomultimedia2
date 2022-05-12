class Estado {
  /* ATRIBUTOS
   - Paleta
   - Objeto que gestiona la interacción
   - Arreglo de objetos tipo TRAZO
   - Arreglo de objetos tipo LÍNEA
   - String para trabajar con la lógica de estados
   - Boolean que me va a servir para determinar si hay o no actividad
   - Contadores para distintos estados / momentos
   */
  Paleta paleta;
  GestorDeInteraccion g;
  ArrayList<Trazo> ts;
  ArrayList<Linea> ls;
  String estado;
  boolean estadoInactivo;
  int contadorlineas, contadormovimiento, contadorinactivo;

  Estado(Paleta paleta) {
    this.paleta = paleta;
    ;
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
    // ----- Estado "INICIAL"
    if (estado.equals("inicial")) {
      estadoInactivo = false; // Declaro que la booleana es falsa; hay actividad
      p.dibujarUnFondo(); // Dibujo un fondo
      dibujarTrazos(graficotrazos); // Llamo al método - está en esta misma pestaña pero más abajo - para dibujar los trazos
      if (g.hayMovimiento) { // Si se detecta movimiento y pasan X segundos desde que se mueve el mouse, se cambia de estado
        contadormovimiento++;
        int limiteCM = 10; // Esto realmente NO es necesario pero lo hice para que, cuando haya un "reset", no empiece de entrada en el estado actividad
        if (contadormovimiento > limiteCM) {
          saltarAlEstado("actividad");
          contadormovimiento = 0; // Reseteo el contador del movimiento
        }
      } // ----- Estado "ACTIVIDAD"
    } else if (estado.equals("actividad")) {
      p.dibujarUnFondo(); // ----- Vuelvo a dibujar el fondo (chequear si es necesario)
      dibujarTrazos(graficotrazos); // Llamo nuevamente al método para dibujar trazos
      dibujarLineas(graficolineas); // Llamo al método - también está en esta misma pestaña pero más abajo - para que comiencen a dibujarse las líneas
      estadoInactivo(); // Llamo al método que evalúa si hay actividad y, en caso de no haberlo, cambia el estado a "inactividad"
    } // ----- Estado "INACTIVIDAD"
    else if (estado.equals("inactividad")) {
      graficolineas.background(252, 252, 250, 10); // Agrego un background al PGraphics de lineas
      graficotrazos.background(252, 252, 250, 10); // Agrego un background al PGraphics de trazos
      for (int i = ls.size()-1; i >= 0; i--) {
        ls.remove(i);
      } // Elimino todos los elementos del ArrayList ls (chequear esto porque esto los elimina pero no los borra. Adjunto en otra carpeta ejemplo de Daniel hoy)
      if (g.hayMovimiento) { // Si se detecta movimiento se vuelve al estado "INICIAL" y el ciclo comienza a empezar
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
      contadorinactivo ++; // Si NO hay movimiento, el contador de inactividad comienza a incrementarse
      if (contadorinactivo > 200) {
        estadoInactivo = true; // Cuando el contador supera el valor deseado, la boolean de inactividad se vuelve verdadera
        contadorinactivo = 0; // Reseteo el contador. Siempre que usamos contador es importante resetearlo al cumplir su función (en este caso, superar 200)
        if (estadoInactivo) { // Si la boolean de inactividad es verdadera, hay un cambio de estado
          saltarAlEstado("inactividad");
          contadorinactivo = 0; // Chequear si esta linea es necesaria o es redundante
        }
      }
    } else { // Si !g.noHayMovimiento (es decir, si HAY movimiento)
      contadorinactivo = 0; // Reseteo el contador de inactividad para que no incremente y no cambie de estado
      estadoInactivo = false; // La boolean de inactividad es falsa (chequear)
    }
  }

  // ----- LÍNEAS
  void dibujarLineas(PGraphics graficolineas) {
    if (g.movGrande) { // Si el movimiento es GRANDE, incremento el contador de lineas
      contadorlineas++;
      if (contadorlineas == 90) { // Cuando el contador de lineas llega a un valor deseado, se agrega un nuevo objeto de tipo linea al ArrayList
        ls.add(new Linea(paleta, int(random(7)), mouseX, mouseY));
        contadorlineas = 0;
        /*
        El sistema de "contador" lo implenté en este caso para medir de alguna manera la cantidad de lineas que se dibujan.
         Prueben sacandolo, disminuyendo su valor o incrementándolo, van a ver que varía la frecuencia con la que aparecen.
         */
      }
    }
    for (Linea l : ls) { // Dibujo las lineas
      l.dibujar(graficolineas);
    }
  }

  // ----- TRAZOS
  void dibujarTrazos(PGraphics graficotrazos) {
    /*
    Los primeros tres valores corresponden a posiciones del mouseX en pantalla.
     Chequear cómo pasamos estos valores a sonido
     */
    float valorX1 = 315;
    float valorX2 = 630;
    float valorX3 = 950;
    // Establezco las condiciones según las posiciones del mouse y llamo al método que dibuja trazos segun la cantidad de frames x seg
    if (mouseX > 0 && mouseX < valorX1) {
      trazosPorFrame(graficotrazos, 60);
    } else if (mouseX > valorX2 && mouseX < valorX3 ) {
      trazosPorFrame(graficotrazos, 2);
    } else {
      trazosPorFrame(graficotrazos, 10);
    }
  }
  // REVISAR que no se ve orgánico como aparecen, se ve trabado ??¡
  void trazosPorFrame(PGraphics graficotrazos, float frame) {
    if (frameCount%frame == 0) { // Si el módulo del frameCount por un número que paso por parámetro es == a 0, agrego un nuevo trazo.
      ts.add(new Trazo(p, int(random(15))));

      //t.dibujar(graficotrazos);
    }
    for (Trazo t : ts) {
      t.dibujar(graficotrazos);
    }
  }
}
