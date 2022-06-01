// ---- Importar la librería
import oscP5.*;

// ---- Variables globales de calibración
float UMBRAL_AMPLITUD = 30;
float UMBRAL_RUIDO = 100;

float MIN_AMP = UMBRAL_AMPLITUD;
float MAX_AMP = 80;

float MIN_PITCH = 54;
float MAX_PITCH = 68;

float amortiguacion = 0.9;

boolean monitor = false;

float umbralDeTiempo = 2000;

// ---- Declarar los objetos osc y GestorSenial
OscP5 osc;
GestorSenial gAmp, gPitch;

// ---- Estados
boolean haySonido = false;
boolean antesHabiaSonido = false;
boolean hayRuido = false;

// ---- Eventos
boolean empezoElSonido = false;
boolean terminoElSonido = false;

float amp, pitch, brillo;
int ruido = 0;
long marcaDeTiempo;

// ---- Trazos, paleta, gráfico de fondo
Paleta p, ptrazos;
ArrayList<Trazo> ts, tf;
ArrayList<Linea> ls;
int tinte, tintefondo, frame;
PGraphics fondo;
color colorfondo;

void setup() {
  size(1000, 950);
  // ---- Inicio objetos paleta, trazos y lineas
  p = new Paleta( "paleta0" + int(random(4)) + ".png");
  ptrazos = new Paleta("eduardotrazos.png");
  ts = new ArrayList<Trazo>();
  ls = new ArrayList<Linea>();
  tf = new ArrayList<Trazo>();

  // ---- Inicialización de objetos osc y gestorSenial
  osc = new OscP5(this, 12345);
  gPitch = new GestorSenial(MIN_PITCH, MAX_PITCH, amortiguacion);
  gAmp = new GestorSenial(MIN_AMP, MAX_AMP, amortiguacion);
  
  // ---- Fondo
  fondo = createGraphics(width, height);
  fondo.beginDraw();
  background(241, 239, 237);
  for (int i = 0; i < 20; i++) {
    tf.add(new Trazo(p, random(width)-100, random(height), int(random(180)), int(random(21))));
  }
  for (Trazo t : tf) {
    t.dibujarFondo(fondo);
  }
  fondo.endDraw();
  image(fondo, 0, 0);
}

void draw() {
  // ---- Sonido
  gPitch.actualizar(pitch);
  gAmp.actualizar(amp);
  haySonido = gAmp.filtradoNorm() > 0.1; // Estado
  hayRuido = ruido > UMBRAL_RUIDO && !haySonido; // Estado

  empezoElSonido = !antesHabiaSonido && haySonido; //Evento
  terminoElSonido = antesHabiaSonido && !haySonido; //Evento

  // ---- Mapeo el pitch y el amp y los asigno a variables enteras
  float pitchtinte = map(gPitch.filtradoNorm(), 0, 1, 10, 255);
  tinte = int(pitchtinte); // En función de esta variable se da la saturación de los trazos
 // float ampframe = map(gAmp.filtradoNorm(), 0, 1, 0, 30);
 float ampframe = gAmp.filtradoNorm();
  frame = int(ampframe); // En función de esta variable se agregan más o menos trazos por frame
println(ampframe);
  // ---- Interacción
  if (empezoElSonido) {
    marcaDeTiempo = millis();
  }
  if (haySonido && !hayRuido) { 
    background(241, 239, 237);
    image(fondo, 0, 0);
    if (frame >= 0 && frame < 0.2) { 
      //ts.add(new Trazo(p, random(width)+100, random(height), tinte, int(random(21))));
      tPorFrame(1);
    } else if (frame >= 0.2 && frame <0.5) {
      tPorFrame(10);
      //for (int i = 0; i < 5; i ++) {
      //  ts.add(new Trazo(p, random(width)+100, random(height), tinte, int(random(21))));
      //} ---------- > Esta opción habría que evaluarla. En función de framecount%frame == 0, se iban agregando trazos al arrayList de a uno, de a 5 o de a 10
    } else if (frame >= 0.5) {
      tPorFrame(5);
      //for (int i = 0; i < 10; i ++) {
      //  ts.add(new Trazo(p, random(width)+100, random(height), tinte, int(random(21))));
      //}
    }
    if (ts.size() >= 10) {
      ts.remove(0);
    }
    for (Trazo t : ts) {
      t.dibujar();
    }
    for (Linea l : ls) {
      l.dibujar();
    }
  }
  if (terminoElSonido) {
    long momentoActual = millis();
    if (momentoActual < marcaDeTiempo + umbralDeTiempo) { // Si el sonido es corto se dibuja una linea o garabato
      ls.add(new Linea(ptrazos, random(width), random(height), tinte, int(random(10))));
    }
    if (ls.size() >= 6) {
      ls.remove(0);
    }
  }
  antesHabiaSonido = haySonido;
}

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
    ts.add(new Trazo(p, random(width)-100, random(height), tinte, int(random(21))));
  }
}
