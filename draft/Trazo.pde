
class Trazo{
  
  PImage img[];
  float x;
  float y; 
  float tam;
  int n;
  
  Trazo(){
      img = new PImage[4];
      for(int i = 0; i < 4; i ++){
        img[i] = loadImage("trazo" + nf(i, 2) + ".png");
      }
      x = random(width);
      y = random(height);
      
      tam = 100;
      n = int(random(0, 4));
      
  }
  
  void agregar(){
      for(int i = 0; i < 4; i ++){
        image(img[n], x, y, tam, tam);
      }
  }

}
