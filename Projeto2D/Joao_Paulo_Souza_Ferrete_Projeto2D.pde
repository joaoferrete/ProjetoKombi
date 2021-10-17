import processing.sound.*;
SoundFile som, buzina;

int limpadorEX=0;
int limpadorEY=0;
int retrovisorX=0;
int piscaalerta = 0;
int corPiscaE = #E8E8E8;
int corPiscaD = #E8E8E8;
int corFarol = #B3B485;

boolean diminui=true;
boolean Parabrisa = false;
boolean retrovisor=true;
boolean piscaAlerta=false;
boolean setaEsq = false;
boolean setaDir = false;
boolean farol = false;
boolean salvar = true;
boolean motor = false;



void setup(){
  size(600, 600);
  som = new SoundFile(this, "motor.mp3");
  buzina = new SoundFile(this, "buzina.mp3");
}

void draw(){
  background(#86DAFF);
  //sol
  fill(#E8FA00);
  ellipse(0,0,200,200);
  //grama
  fill(#47D33E);
  rect(0,400,600,600);
  //rodas
   fill(#343333);
   ellipse(180, 470, 25, 50);
   ellipse(420, 470, 25, 50);
   
   //bordas
   fill(255, 0, 0);
   ellipse(300, 150, 270, 30); //Cima
   fill(#FFF68B);
   ellipse(150, 365, 20, 170);  //Esquerda
   ellipse(450, 365, 20, 170);  //Direita
   
   fill(#39E3D9);
   triangle(150, 280, 165, 150, 335, 280);
   triangle(450, 280, 435, 150, 335, 280);
   
   
   //Chassi
   noStroke();
   fill(#39E3D9);
   rect(165, 150, 270, 130); //De cima
   fill(#FFF68B);
   rect(150, 280, 300, 170);  //De baixo
   stroke(0);
   
   
   //Vidros
   fill(#B9B8B8);
   rect(175, 170, 120, 90);
   rect(305, 170, 120, 90);
   
   //Bordinha de cima
   fill(#FBFCA1);
   noStroke();
   ellipse(300, 150, 270, 15);
   
   //Detalhe Chassi   
   noStroke();
   fill(#39E3D9);
   triangle(165, 280, 300, 450, 435, 280);
   stroke(0);
   line(150, 280, 450, 280);
   
   //Para-choque
   fill(255, 0 ,0);
   ellipse(300, 450, 345, 35);  //Elipse de fora
   fill(#FF6464);
   ellipse(300, 450, 335, 10);  //Elipse de dentro
   fill(250);
   ellipse(225, 450, 10, 45);  //Detalhe
   ellipse(375, 450, 10, 45);  //Detalhe
   fill(#FFF68B);
   rect(260, 435, 80, 30);  //Placa
   
   //Farol
   if(piscaAlerta){
     if(piscaalerta==30 && corPiscaD==#E8E8E8){
       corPiscaD=#FFB51F;
       corPiscaE=#FFB51F;
       piscaalerta=0;
     }
     else if(piscaalerta==30){
       corPiscaD = #E8E8E8;
       corPiscaE = #E8E8E8;
       piscaalerta=0;
     }
     else piscaalerta++;
   }
   else if( setaEsq ){
     if(piscaalerta==30 && corPiscaE==#E8E8E8){
       corPiscaE=#FFB51F;
       piscaalerta=0;
     }
     else if(piscaalerta==30){
       corPiscaE = #E8E8E8;
       piscaalerta=0;
     }
     else piscaalerta++;
   }
   else if (setaDir){
     if(piscaalerta==30 && corPiscaD==#E8E8E8){
       corPiscaD=#FFB51F;
       piscaalerta=0;
     }
     else if(piscaalerta==30){
       corPiscaD = #E8E8E8;
       piscaalerta=0;
     }
     else piscaalerta++;
   }
   
   else {
     corPiscaD = #E8E8E8; 
     corPiscaE = #E8E8E8;
   }
   
   fill(corPiscaE);
   ellipse(170, 340, 20,20);   //Farol pequena
   fill(corPiscaD);
   ellipse(430, 340, 20, 20);
   
   
   //Farol grande
   if(farol) corFarol = 255;
   else corFarol = #B3B485;
   fill(corFarol);
   ellipse(200, 390, 55, 55);
   ellipse(400, 390, 55, 55);
   
   
   
   //Simbolo
   fill(0);
   ellipse(300, 340, 80, 80);
   fill(#39E3D9);
   ellipse(300, 340, 70, 70);
   
   fill(#833924);
   noStroke();
   rect(297, 305, 6, 70);  //Coiso da cruz
   rect(265, 337, 70, 6);
   stroke(0);
   
   //Limpador
   strokeWeight(2);
   fill(150);
   line(270-2*limpadorEX, 215-limpadorEY, 235, 270);
   line(400-2*limpadorEX, 215-limpadorEY, 365 ,270);
   //Fazer parabrisa mexer
   if(Parabrisa){
     if(limpadorEX < 15 && diminui) limpadorEY--;
     else if(limpadorEX> 15 && !diminui)limpadorEY--;
     else if(limpadorEX < 15 && !diminui) limpadorEY++;
     else limpadorEY++;
     
     if(limpadorEX==31 && !diminui ){
       diminui = true;
       limpadorEX--;
     }
     else if(!diminui) limpadorEX++;
     else if(diminui && limpadorEX==0){
       diminui=false;
       limpadorEX++;
     }
     else limpadorEX--;
   }

   
   
   //Retrovisor
   fill(#FFA652);
   ellipse(120+2*retrovisorX, 240-retrovisorX, 30-retrovisorX, 30);
   line(150, 280, 120+2*retrovisorX, 240-retrovisorX);
   ellipse(480-2*retrovisorX, 240-retrovisorX, 30-retrovisorX, 30);
   line(450, 280, 480-2*retrovisorX, 240-retrovisorX);
   if(retrovisor){
     if(retrovisorX<10) retrovisorX++;
     else if(retrovisorX==0) retrovisorX++;
   }
     
   if (!retrovisor){
     if(retrovisorX==10) retrovisorX--;
     else if(retrovisorX >0) retrovisorX--;
   }

 
  
  
  if(salvar){
    save("Kombi.png");
    salvar=false;
  }
}

void keyPressed(){
  //Variaveis de movimento
  if(keyCode==76) Parabrisa = !Parabrisa;
  if(keyCode==82) retrovisor = !retrovisor;
  if(keyCode==65) piscaAlerta = !piscaAlerta;
  if(keyCode==37 || keyCode==52) setaEsq = !setaEsq;
  if(keyCode==39 || keyCode==54) setaDir = !setaDir;
  if(keyCode==70) farol = !farol;
  if(keyCode==66) buzina.play();
  if(keyCode==77){
    if (!motor){
      farol = true;
      retrovisor = false;
      som.play();
      motor= true;
    }
    else{
      farol = false;
      retrovisor = true;
      setaEsq = false;
      setaDir = false;
      piscaAlerta=false;
      Parabrisa=false;
      som.stop();
      motor=false;
    }
  }
}
