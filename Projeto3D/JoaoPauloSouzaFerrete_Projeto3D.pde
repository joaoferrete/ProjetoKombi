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

float t3 = 0;

float cameraSpeed;
float cameraRotateX;
float cameraRotateY;

void setup(){
  size(600, 600, P3D);
  som = new SoundFile(this, "motor.mp3");
  buzina = new SoundFile(this, "buzina.mp3");
  cameraRotateX = -PI/6;
  cameraRotateY = PI/3;
  cameraSpeed = TWO_PI / width;
}

void draw(){
    //Luzes
    //ambientLight(80, 100, 110);
    //directionalLight(255, 255, 126, 1, 1, 0);
    //directionalLight(0, 0, -250, -1, 1, -1);
    perspective();
    translate(300, 300, -250);
    lights();
    spotLight(100,102, 126, mouseX, mouseY, 2000, 0, 0, -1, PI/2, 10000);
    pointLight(51,102, 126, mouseX, mouseY, 2000);
  
    translate(-300, -300, 250);
    
    cameraSpeed = TWO_PI/width;
    translate(300, 300, t3);
  
  if(mousePressed){
    cameraRotateX+= (pmouseY - mouseY) * cameraSpeed;
    cameraRotateY+= (pmouseX - mouseX) * cameraSpeed;
    cameraRotateX = constrain(cameraRotateX, -PI/2, 0);
    cameraRotateY = constrain(cameraRotateY, -PI/2, PI/2);

    rotateX(cameraRotateX);
    rotateY(cameraRotateY);
  }

  else{
    rotateX(cameraRotateX);
    rotateY(cameraRotateY);
  }
  
  translate(-300, -300);
  pushMatrix();
  background(#86DAFF);
  //sol
  translate(-100, -200, -100);
  fill(#E8FA00);
  noStroke();
  sphere(75);
  translate(200, 200, 200);
  //ellipse(0,0,200,200);
  //grama
  stroke(1);
  fill(#47D33E);
  translate(300, 545);
  box(1000, 85, 1500);
  
  popMatrix();
  pushMatrix();
  //rect(0,400,600,600);
  
  //rodas
    fill(0);

    stroke(#151515);
    
    //rotateY(PI/4);

    // front-right
    translate(170,450 , -100 );
    rotateX(PI/4);
    rotateZ(PI/2);
    cylinder(50, 50, 30, 15); 
    popMatrix();
    pushMatrix();
    
    
    // front-left
    translate(460, 450, -100);
    rotateX(PI/4);
    rotateZ(PI/2);
    cylinder(50, 50, 30, 15); 
    
    popMatrix();
    pushMatrix();
    
    // back-left
    translate(460, 450, -400);
    rotateX(PI/4);
    rotateZ(PI/2);
    cylinder(50, 50, 30, 15);
    popMatrix();
    pushMatrix();
    
    
    // back-right
    translate(170, 450, -400);
    rotateX(PI/4);
    rotateZ(PI/2);
    cylinder(50, 50, 30, 15); 
    
  popMatrix();
  pushMatrix();
  
  /*
   fill(#343333);
   translate(180, 470);
   sphere(25);
   //ellipse(180, 470, 25, 50);
   translate(240, 0);
   //ellipse(420, 470, 25, 50);
   sphere(25);
   popMatrix();
   pushMatrix();
   */
   
   //bordas
   translate(0,0, 30);
   fill(255, 0, 0);
   //ellipse(300, 150, 270, 30); //Cima
   //fill(#FFF68B);
   //ellipse(150, 365, 20, 170);  //Esquerda
   //ellipse(450, 365, 20, 170);  //Direita
   
   fill(#39E3D9);
   translate(0,0, -52);
   rotateX(0.139626);
   triangle(150, 280, 165, 150, 335, 280);
   triangle(450, 280, 435, 150, 335, 280);
   
   translate(0, 0, -30);
   
   popMatrix();
   pushMatrix();
   
   
   //Chassi
   noStroke();
   fill(#39E3D9);
   translate(300, 215, -250);
   box(270, 130, 500); //De cima
   fill(#FFF68B);
   stroke(1);
   translate(0, 150, 0);
   box(300, 180, 538);  //De baixo
   stroke(0);
   popMatrix();
   pushMatrix();
   
   //Detalhe Chassi de cima
   fill(#39E3D9);
   translate(300, 149, -250);

   box(272, 1, 500);
   
   
   popMatrix();
   pushMatrix();
   
   
   
   //Vidros
   translate(300, 215, -30);
   noStroke();
   fill(#39E3D9);
   rotateX(0.139626);
   box(270, 129, 80);
   stroke(1);
   
   popMatrix();
   translate(0, 0, 30);
   pushMatrix();
   
   translate(0, 0, -49);
   fill(#BCBCBC);
   rotateX(0.139626);
   rect(165, 170, 270, 100, 30);
   
   popMatrix();
   pushMatrix();
   
   //Vidro do lado
   translate(436, 0, 40);
   fill(#BCBCBC);
   rotateY(PI/2);
   rect(165, 170, 100, 80, 30);
  
   translate(0, 0, -272);
   rect(165, 170, 100, 80, 30);
   
   popMatrix();
   pushMatrix();

   translate(436, 0, -180);
   rotateY(PI/2);
   rect(165, 170, 100, 80, 30);
   translate(0, 0, -272);
   rect(165, 170, 100, 80, 30);
   
   popMatrix();
   pushMatrix();
   
   
   //Bordinha de cima
   fill(255, 0, 0);
   translate(300, 152, -258);
   box(271, 5, 465); //De cima
   
   popMatrix();
   pushMatrix();
   
   
   translate(0, 0, -10);
   
   
   //Detalhe Chassi   
   noStroke();
   fill(#39E3D9);
   triangle(165, 275, 300, 450, 435, 275);
   stroke(0);

   
   //Para-choque
   popMatrix();
   pushMatrix();
   
   fill(#C9C9C9);
   translate(300, 450, -250);
   box(302, 10, 508);  //De baixo
   popMatrix();
   pushMatrix();
   fill(#A09999);
   translate(300, 432, -71);
   box(302, 25, 150);
   popMatrix();
   pushMatrix();
   
   fill(#FFF68B);
   translate(0, 0, 5);
   rect(260, 420, 80, 30);  //Placa
   
   popMatrix();
   translate(0, 0, -10);
   pushMatrix();
   
   /*
   fill(255, 0 ,0);
   ellipse(300, 450, 345, 35);  //Elipse de fora
   fill(#FF6464);
   ellipse(300, 450, 335, 10);  //Elipse de dentro
   fill(250);
   ellipse(225, 450, 10, 45);  //Detalhe
   ellipse(375, 450, 10, 45);  //Detalhe
   
   
   */
   
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
   noStroke();
   translate(170, 340);
   sphere(10);
   //ellipse(170, 340, 20,20);   //Farol pequena
   
   
   fill(corPiscaD);
   translate(260, 0);
   sphere(10);
   //ellipse(430, 340, 20, 20);
   
   
   translate(-430, -340, -10);
   
   //Farol grande
   if(farol) corFarol = 255;
   else corFarol = #B3B485;
   fill(corFarol);
   noStroke();
   translate(200, 390);
   sphere(25);
   translate(200, 0);
   sphere(25);
   translate(-400, -390, +10);
   stroke(1);
   strokeWeight(3);
   ellipse(200, 390, 48, 48);
   ellipse(400, 390, 48, 48);
   
   
   //Simbolo
   translate(0, 0, 2);
   fill(0);
   ellipse(300, 340, 80, 80);
   fill(#39E3D9);
   translate(0, 0, 2);
   ellipse(300, 340, 70, 70);
   
   fill(#833924);
   noStroke();
   translate(0, 0, 2);
   rect(297, 305, 6, 70);  //Coiso da cruz
   rect(265, 337, 70, 6);
   stroke(0);
   
   popMatrix();
   pushMatrix();
   
   //Limpador
   translate(0, 0, -39);
   rotateX(0.139626);
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
   
   popMatrix();


   //Retrovisor
   translate(0, 0, -55);
   pushMatrix();
   
   fill(#FFA652);
   noStroke();
   translate(120+2*retrovisorX, 240-retrovisorX, 0);
   rotateX(PI/2);
   cylinder(15-retrovisorX/2, 15-retrovisorX/2, 10-retrovisorX/2, 100);
   popMatrix();
   pushMatrix();   
   
   //ellipse(480-2*retrovisorX, 240-retrovisorX, 30-retrovisorX, 30);
   translate(480-2*retrovisorX, 240-retrovisorX);
   rotateX(PI/2);
   cylinder(15-retrovisorX/2, 15-retrovisorX/2, 10-retrovisorX/2, 100);
   popMatrix();
   pushMatrix();
   
   stroke(0);
   strokeWeight(4);
   line(153, 280, 120+2*retrovisorX, 240-retrovisorX);
   line(447, 280, 480-2*retrovisorX, 240-retrovisorX);
   
   strokeWeight(3);
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
  popMatrix();
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


void mouseWheel(MouseEvent event){
  t3 += event.getCount()*50;
}





void cylinder(float bottom, float top, float h, int sides)
{
  pushMatrix();
  
  translate(0,h/2,0);
  
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];
  
  float[] x2 = new float[sides+1];
  float[] z2 = new float[sides+1];
 
  //get the x and z position on a circle for all the sides
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * bottom;
    z[i] = cos(angle) * bottom;
  }
  
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x2[i] = sin(angle) * top;
    z2[i] = cos(angle) * top;
  }
 
  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN);
 
  vertex(0,   -h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
  }
 
  endShape();
 
  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
    vertex(x2[i], h/2, z2[i]);
  }
 
  endShape();
 
  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN); 
 
  vertex(0,   h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x2[i], h/2, z2[i]);
  }
 
  endShape();
  
  popMatrix();
}
