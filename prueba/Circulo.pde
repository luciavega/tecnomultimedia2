class Circulo{
  
  float x, y, tam;
  color colorRelleno;
  
  Circulo(float x, float y){
    this.x = x;
    this.y = y;
    tam = 100;
    colorRelleno = color(random(255), random(255), random(255));
  }
  
  void dibujar(){
    fill(colorRelleno);
    ellipse(x, y, tam, tam);
  }
}
