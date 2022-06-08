class Sonido {

  // ---- Variables globales de calibración 
  float UMBRAL_AMPLITUD = 25;

  float MIN_AMP = UMBRAL_AMPLITUD;
  float MAX_AMP = 100;

  float MIN_PITCH = 52;
  float MAX_PITCH = 68;

  float amortiguacion = 0.9; 

  boolean monitor = false;

  float umbralDeTiempo = 2000;

  // ---- Objetos sonido
  OscP5 osc; 
  GestorSenial gAmp, gPitch;

  // ---- Estados
  boolean haySonido = false;
  boolean antesHabiaSonido = false;
  boolean hayRuido = false;
  String estado;

  // ---- Eventos
  boolean empezoElSonido = false;
  boolean terminoElSonido = false;
  float amp, pitch;
  int ruido = 0;
  long marcaDeTiempo;
  int contador = 0;

  // ---- Trazos, paletas
  ArrayList<Trazo> tf, ts;
  ArrayList<Linea> ls;
  Paleta p;
  int ptinte;
  Sonido() {
    inicializar_trazos();
    inicializar_sonido();
  }

  // ---- Inicializo objetos 
  void inicializar_sonido() {
    osc = new OscP5(this, 12345); // inicializo el objeto
    gAmp = new GestorSenial(MIN_AMP, MAX_AMP, amortiguacion);
    gPitch = new GestorSenial(MIN_PITCH, MAX_PITCH, amortiguacion);
    estado = "inicial";
  }
  void inicializar_trazos() {
    ls = new ArrayList<Linea>();
    ts = new ArrayList<Trazo>();
    tf = new ArrayList<Trazo>();
    p = new Paleta("paleta01.png");
    for (int i = 0; i <= 8; i++) {
      tf.add(new Trazo(int(random(100, width-100)), int(random(100, height-100)), p, int(random(180)), int(random(18))));
    }
  }

  // ----- Interacción
  void actualizar() {
    gAmp.actualizar(amp);
    gPitch.actualizar(pitch);

    haySonido = gAmp.filtradoNorm() > 0.1; // Estado

    empezoElSonido = !antesHabiaSonido && haySonido; //Evento
    terminoElSonido = antesHabiaSonido && !haySonido; //Enento

    ptinte = int(map(gPitch.filtradoNorm(), 0, 1, 10, 255));
    int frame = int(map(amp, MIN_AMP, MAX_AMP, 60, 1));
    for (Trazo t : tf) {
      t.dibujar();
    }

    // ---- Estado "Inicial"
    if (estado.equals("inicial")) {
      for (Trazo t : tf) {
        t.mover();
      }
      if (empezoElSonido) {
        estado = "interaccion";
      }
    } 
    // ---- Estado "Interacción" 
    if (estado.equals("interaccion")) {

      if (empezoElSonido) {
        marcaDeTiempo = millis();
      }
      if (haySonido) {
        contador = 0;
        //ts.add(new Trazo(int(random(100, width-100)), int(random(100, height-100)), p, ptinte, int(random(3))));
        tPorFrame(frame);
        if (tf.size() <= 2) {
          tf.add(new Trazo(int(random(100, width-100)), int(random(100, height-100)), p, ptinte, int(random(18))));
        }
      }
      if (terminoElSonido) {
        long momentoActual = millis();
        if (momentoActual < marcaDeTiempo + umbralDeTiempo) { // Si el sonido es corto se dibuja una linea o garabato
          ls.add(new Linea(p, random(width), random(height), ptinte, int(random(14))));
        }
        if (ls.size() >= 6) {
          ls.remove(0);
        }
      }
      if (!haySonido) {
        contador++;
        println(contador);
        if (contador > 60) {
          for (Trazo t : tf) {
            t.mover();
          }
          if (ts.size() > 0) {
            for (Trazo t : ts) {
              t.mover();
            }
          }
          if (ls.size() > 0) {
            for (Linea l : ls) {
              l.mover();
            }
          }
        }
      }
      if (ts.size() >= 15) {
        ts.remove(0);
        tf.remove(0);
      }
      for (Trazo t : ts) {
        t.dibujar();
      }
      for (Linea l : ls) {
        l.dibujar();
      }
    }
    antesHabiaSonido = haySonido;
  }
  // ---- Evento osc
  void oscEvent( OscMessage m) {
    if (m.addrPattern().equals("/amp")) {
      amp = m.get(0).floatValue();
    }
    if (m.addrPattern().equals("/pitch")) {
      pitch = m.get(0).floatValue();
    }
    if (m.addrPattern().equals("/ruido")) {
      ruido = m.get(0).intValue();
    }
  }
  // ---- Método para controlar la cantidad de trazos por frame
  void tPorFrame(float frame) {
    if (frameCount%frame == 0) {
      ts.add(new Trazo(random(width)-100, random(height), p, ptinte, int(random(3))));
    }
  }
}
