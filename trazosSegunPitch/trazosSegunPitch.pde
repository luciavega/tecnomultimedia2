          //---- librería
          import oscP5.*;
          //---- declaro el objeto
          OscP5 osc; 

          float amp;
          float minAmp = 50;
          float maxAmp = 100;
          float f=0.8; 
          float pitch;
          float minPitch = 58;
          float maxPitch = 65;
                  
          void setup(){
           size(800, 600);
           background(255,255,255);
           osc= new OscP5 (this, 12345);  
            }
            
              void draw() {   
          //---- c/sonidosGraves
             if (pitch<minPitch) {
                  fill(125, 30, 147);
                  tPorFrame(15);
          //---- c/sonidosAgudos          
              } else if( pitch>maxPitch) {
                fill(245, 222, 15);
                 tPorFrame(10);
          //---- c/sonidosIntermedios   
              } else if (pitch>minPitch && pitch<maxPitch) { 
                fill(0);
                tPorFrame(5);         
              }         
            }
            
        void tPorFrame(float frame) {
        if (frameCount%frame == 0) {
          dibujar();
        }
      }
      
      void dibujar() {
      ellipse(random(width), random(height), 50, 50);
    }
                  
          void oscEvent(OscMessage m) {       
            if (m.addrPattern().equals("/amp")) { 
              amp = m.get(0).floatValue();             
            } else if (m.addrPattern().equals("/pitch")) {
              pitch=m.get(0).floatValue();
            }
          }
          
      
