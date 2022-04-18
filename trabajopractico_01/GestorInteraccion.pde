class GestorInteraccion {
  Dir_y_Vel mouse;
  boolean arriba;
  boolean abajo;
  boolean seMoviaEnElFrameAnterior;

  GestorInteraccion() {
    mouse = new Dir_y_Vel();
  }

  void actualizar() {
    mouse.calcularTodo(mouseX, mouseY);

    boolean seMueveEnEsteFrame = false;
    float sensibilidad = 10;
    if (mouse.velocidad()>sensibilidad && mouse.velocidad()<150) {
      seMueveEnEsteFrame = true;
    }
    arriba = false;
    abajo = false;

    if (seMueveEnEsteFrame &&
      !seMoviaEnElFrameAnterior) {
      arriba = mouse.direccionY()<-sensibilidad?true:false;
      abajo = mouse.direccionY()>sensibilidad?true:false;
    }
  }
}
