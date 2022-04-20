//Trazo trazos;
ArrayList<Trazo> trazos;
int cont;
Paleta p;

void setup() {
  size(1000, 900);
  background( #FFFBF5 );
  p = new Paleta("eduardo_p1.png");
  trazos = new ArrayList();
  trazos.add(new Trazo(p.darUnColor()));
  cont = 0;
  //trazos = new Trazo(p.darUnColor());
}

void draw() {
  //trazos.dibujar();
  cont++;
  for (Trazo t : trazos) {
    t.dibujar();
  }
  if (cont > 10) {
    trazos.add(new Trazo(p.darUnColor()));
  }
  if ( cont > 20) {
    //for (int i = trazos.size() - 1; i > 0; i--) {
    //  trazos.remove(i);
    //}
    trazos.remove(0);
    println(trazos.size());
  }
}
