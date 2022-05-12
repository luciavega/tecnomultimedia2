/*

En este ejemplo, se agregan objetos de tipo círculo al arraylist y si el arraylist llega size de 10, se elimina el primer objeto.
Algo así deberiamos hacer a la hora de "desvanecer" o hacer que desaparezcan los trazos.

*/

ArrayList<Circulo> cs;

void setup() {
  size(800, 800);
  background(100, 155, 100, 100);

  cs = new ArrayList<Circulo>();
 
}

void draw() {
  background(100, 155, 100, 100);
  line(width/2+50, 0, width/2+50, height);
  if (mouseX >= width/2+50) {
    cs.add(new Circulo(random(width), random(height)));
    if (cs.size()>10) {
      cs.remove(0);
    }
  }

  for (Circulo c : cs) {
    println("dibu");
    c.dibujar();
  }

}
