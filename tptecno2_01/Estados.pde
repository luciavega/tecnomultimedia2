/*
  Estado inicial -> Figuras grises
 Estado "activo" ->
 - Mouse en dir. arriba: se le da tinte/saturación a las figuras
 - Mouse en dir. derecha: aumenta la cantidad de figuras que aparecen
 - Mouse rápido: garabatos
 - Mouse lento: lineas
 * Combinaciones
 Estado "inactivo" -> Si no se capta movimiento por 3 seg, las figuras comienzan a "borrarse"
 */

class Estado {
  String estado;
  //ArrayList<Trazo> trazos;
  Trazo trazos;
  Paleta p;
  GestorInteraccion g;

  Estado() {
    p = new Paleta("eduardo_p1.png");
    //trazos = new ArrayList();
    //trazos.add(new Trazo(p.darUnColor()));
    trazos = new Trazo();
    g = new GestorInteraccion();
    cambiarEstado("inicial");
  }

  void cambiarEstado( String nuevoEstado ) {
    estado = nuevoEstado;
  }

  void actualizar() {
    g.actualizar();
    if (estado.equals("inicial")) {
      trazos.dibujar(p.darUnColor());
      trazos.opacidad = 20;
      if (g.arriba) {
        trazos.opacidad = 255;
        cambiarEstado("activo");
      }
    }
    if (estado.equals("activo")) {
      trazos.dibujar(p.darUnColor());
      trazos.opacidad = 255;
    }
  }
}
