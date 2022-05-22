

class duracionTrazos{
//importar librería

//declarar el objeto


Trazos trazos;
Trazos trazos2;
float pitch;
float amp;
float contador=0;
//----------------------
//variables de calibración
float minAmp ;
float maxAmp;
float f; //factor de amortiguación
float minPitch;
float maxPitch;
OscP5 osc;



//  size(600, 600);
  //inicializar
 // osc= new OscP5 (this, 12345); 

 


duracionTrazos(float minAmp_,float maxAmp_,float minPitch_, float maxPitch_, float f_){
 
  contador=0;
//inicializar
  osc= new OscP5 (this, 12345); 
 trazos = new Trazos("trazo", 15);
   trazos2= new Trazos("trazoo", 3);
//variables de calibración
minAmp=minAmp_;
maxAmp=maxAmp_;
minPitch=minPitch_;
maxPitch=maxPitch_;
f=f_;
}
void dibujar() {

  if (amp<minAmp) { //no hay sonido
  //  background(0);
    contador=0;
  } else if ( amp>minAmp) {//hay sonido

    contador++;
  //   background( #FFFBF5 );
   // background(0, 255, 0);
// trazos.dibujar(paleta.darUnColor(), true);
 
    if (contador<=+2) {//corta duración

   //   fill(255, 0, 0);
      //ellipse(width/2, height/2, 100, 100); 
      trazos2.dibujar(paleta2.darUnColor(), false); 
    
} else if (contador>+5) { //larga duración
      trazos.dibujar(paleta.darUnColor(), true);
   //   fill(0, 0, 255);
      //ellipse(width/2, height/2, 100, 100);
  
  }
    println(contador);
  }
}

void oscEvent(OscMessage m) {

  if (m.addrPattern().equals("/amp")) { 
    amp = m.get(0).floatValue(); 
    //println(amp);
    //   println("amp: "+amp );
  } else if (m.addrPattern().equals("/pitch")) {
    pitch=m.get(0).floatValue();
    // println("pitch: "+pitch);
  }
}

}
