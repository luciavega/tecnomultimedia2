
class GestorDeInteraccion {
  /* ATRIBUTOS
    - Objeto que evalúa direccion y velocidad
    - Boolean para ver si hay un movimiento grande o uno pequeño
    - Boolean para determinar si hay o no movimiento
    - Contadores para el movimiento grande y pequeño 
  */
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
    if (mouse.velocidad() > 0) { // Si la velocidad del mouse supera el umbral de 0, significa que hay movimiento 
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
    tiempoG = constrain(tiempoG, 0, 90); // Limito los contadores entre 0 y 90
    tiempoP = constrain(tiempoP, 0, 90); // Limito los contadores entre 0 y 90
    if (mouse.velocidad()>10) {
      float  umbral = 50; // Determino un umbral de velocidad
      if (mouse.velocidad() > umbral) { // Si la velocidad supera ese umbral, incrementa el contador de la velocidad grande y disminuye la velocidad pequeña
        tiempoG += 10;
        tiempoP -=10;
      } else {
        if (tiempoG <10) { // Si el contador del movimiento grande es menor a 10, incrementa el contador del movimiento pequeño 
          tiempoP +=10;
        }
      }
    }
    if (tiempoG> 50) { // Si el contador del movimiento grande supera el umbral de 50 (deberia ir el valor en variable), el movimiento grande es verdadero
      movGrande = true;
    }
    if (tiempoP > 50) { // Si el contador del movimiento chico supera el umbral de 50 (deberia ir el valor en variable), el movimiento chico es verdadero
      movPeque = true;
    }
  }
}
