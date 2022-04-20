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
  ArrayList<Trazo> trazos;
  Paleta p;
  

  Estado() {
    cambiarEstado("inicial");
  }

  void cambiarEstado( String nuevoEstado ) {
    estado = nuevoEstado;
  }
}
