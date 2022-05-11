
class GestorDeInteraccion {
  Dir_y_Vel mouse;
  boolean movGrande, movPeque;
  boolean hayMovimiento, noHayMovimiento;
  float tiempoG, tiempoP;

  GestorDeInteraccion() {
    mouse = new Dir_y_Vel();
  }
  // ----- MÉTODOS
  void actualizar() {
    mouse.calcularTodo(mouseX, mouseY);
    movGrande_Peque();
    movimiento();
  }
  // ----- EVALÚA SI HAY MOVIMIENTO
  void movimiento() {
    hayMovimiento = false;
    noHayMovimiento = false;
    if (mouse.velocidad() > 0) {
      hayMovimiento = true;
    } else if (mouse.velocidad() == 0) {
      noHayMovimiento = true;
    }
  }
  // ----- EVALÚA SI EL MOVIMIENTO ES GRANDE O PEQUEÑO
  void movGrande_Peque(){
    movGrande = false;
    movPeque = false;
    tiempoG--;
    tiempoP--;
    tiempoG = constrain(tiempoG, 0, 90);
    tiempoP = constrain(tiempoP, 0, 90);
    if (mouse.velocidad()>10) {
      float  umbral = 50;
      if (mouse.velocidad() > umbral) {
        tiempoG += 10;
        tiempoP -=10;
      } else {
        if (tiempoG <10) {
          tiempoP +=10;
        }
      }
    }
    if (tiempoG>50) {
      movGrande = true;
    }
    if (tiempoP > 50) {
      movPeque = true;
    }
  }
}
