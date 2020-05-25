import processing.serial.*;
import ddf.minim.*;
import controlP5.*;
ControlP5 cp5;

Serial myPort; 

int ancho = 800;
int alto = 300;
PFont f; 
PFont f2;
int puerto;
String[] port_list;
int num_port;
boolean seleccion = true;
String comando = ""; 
boolean inicio=true;

int A1pos=0;
int A2pos=0;
int A3pos=0;
int A4pos=0;
int A5pos=0;
int A6pos=0;
int A7pos=0;


void setup()
{
  f = createFont("Arial",16,true);
  f2 = createFont("Arial Black",16,true);
  num_port = Serial.list().length;
  background(0,0,0);
  size(800,480);
  int y=130;
  fill(255,255,255);
  textFont(f2,30);
  
 // puerto=2;
 // setup2();
  noStroke();
  text("Selecciona un puerto", 50, 50);
  textFont(f,15);
  for (int i=0;i<num_port;i++)
  {   
    text(i,50,y);
    text("-",70,y);
    text(Serial.list()[i],90,y);
    y=y+40;
 }


  
}



void setup2 () 
{
seleccion = false;
background(255,255,255);
size(800, 480);   
f = createFont("Arial",16,true);
f2 = createFont("Arial Black",16,true);
myPort = new Serial(this, Serial.list()[puerto], 115200);
myPort.bufferUntil('\n');



myPort.clear();

cp5 = new ControlP5( this );
  cp5.addSlider("slider1")
   .setPosition(50,360)
   .setSize(700,30)
   .setRange(180,-180)
   .setValue(0)
    ;
    
    cp5.addSlider("slider2")
   .setPosition(50,290)
   .setSize(700,30)
   .setRange(90,-90)
   .setValue(0)
    ;
    
    cp5.addSlider("slider3")
   .setPosition(50,220)
   .setSize(700,30)
   .setRange(90,-90)
   .setValue(0)
    ;    

    cp5.addKnob("slider4")
   .setPosition(50,40)
   .setRadius(75)
   .setRange(180,-180)
   .setValue(0)
    ;  
    
     cp5.addSlider("slider5")
   .setPosition(285,40)
   .setSize(30,150)
   .setRange(90,-90)
   .setValue(0)
    ;     
 
    cp5.addKnob("slider6")
   .setPosition(400,40)
   .setRadius(75)
   .setRange(180,-180)
   .setValue(0)
    ;  
    
     cp5.addSlider("slider7")
   .setPosition(600,100)
   .setSize(150,30)
   .setRange(0,255)
   .setValue(0)
    ;        

//**************************************************

  cp5.addButton("A12")
   .setPosition(210,335)
   .setSize(30,20)
   .setValue(0)
   .setLabel("90º")
   ;
   
  cp5.addButton("A13")
   .setPosition(35,335)
   .setSize(30,20)
   .setValue(0)
   .setLabel("180º")
   ;
   
  cp5.addButton("A14")
   .setPosition(562,335)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-90º")
   ;
   
  cp5.addButton("A15")
   .setPosition(735,335)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-180º")
   ;   

     cp5.addButton("A11")
   .setPosition(385,335)
   .setSize(30,20)
   .setValue(0)
   .setLabel("0º")
   ;
 
//**************************************************   
   
  cp5.addButton("A22")
   .setPosition(210,265)
   .setSize(30,20)
   .setValue(0)
   .setLabel("45º")
   ;
   
  cp5.addButton("A23")
   .setPosition(35,265)
   .setSize(30,20)
   .setValue(0)
   .setLabel("90º")
   ;
   
  cp5.addButton("A24")
   .setPosition(562,265)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-45º")
   ;
   
  cp5.addButton("A25")
   .setPosition(735,265)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-90º")
   ;   

     cp5.addButton("A21")
   .setPosition(385,265)
   .setSize(30,20)
   .setValue(0)
   .setLabel("0º")
   ; 
   
//**************************************************   
   
  cp5.addButton("A32")
   .setPosition(210,195)
   .setSize(30,20)
   .setValue(0)
   .setLabel("45º")
   ;
   
  cp5.addButton("A33")
   .setPosition(35,195)
   .setSize(30,20)
   .setValue(0)
   .setLabel("90º")
   ;
   
  cp5.addButton("A34")
   .setPosition(562,195)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-45º")
   ;
   
  cp5.addButton("A35")
   .setPosition(735,195)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-90º")
   ;   

     cp5.addButton("A31")
   .setPosition(385,195)
   .setSize(30,20)
   .setValue(0)
   .setLabel("0º")
   ;  

//**************************************************
   
  cp5.addButton("A42")
   .setPosition(10,80)
   .setSize(30,20)
   .setValue(0)
   .setLabel("90º")
   ;
   
  cp5.addButton("A43")
   .setPosition(20,150)
   .setSize(30,20)
   .setValue(0)
   .setLabel("180º")
   ;
   
  cp5.addButton("A44")
   .setPosition(205,80)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-90º")
   ;
   
  cp5.addButton("A45")
   .setPosition(200,150)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-180º")
   ;   

     cp5.addButton("A41")
   .setPosition(110,18)
   .setSize(30,20)
   .setValue(0)
   .setLabel("0º")
   ;  

//**************************************************   

  cp5.addButton("A52")
   .setPosition(320,142)
   .setSize(30,20)
   .setValue(0)
   .setLabel("45º")
   ;
   
  cp5.addButton("A53")
   .setPosition(320,180)
   .setSize(30,20)
   .setValue(0)
   .setLabel("90º")
   ;
   
  cp5.addButton("A54")
   .setPosition(320,70)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-45º")
   ;
   
  cp5.addButton("A55")
   .setPosition(320,30)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-90º")
   ;   

     cp5.addButton("A51")
   .setPosition(320,105)
   .setSize(30,20)
   .setValue(0)
   .setLabel("0º")
   ;  

//**************************************************  

  cp5.addButton("A62")
   .setPosition(360,80)
   .setSize(30,20)
   .setValue(0)
   .setLabel("90º")
   ;
   
  cp5.addButton("A63")
   .setPosition(370,150)
   .setSize(30,20)
   .setValue(0)
   .setLabel("180º")
   ;
   
  cp5.addButton("A64")
   .setPosition(555,80)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-90º")
   ;
   
  cp5.addButton("A65")
   .setPosition(550,150)
   .setSize(30,20)
   .setValue(0)
   .setLabel("-180º")
   ;   

     cp5.addButton("A61")
   .setPosition(460,18)
   .setSize(30,20)
   .setValue(0)
   .setLabel("0º")
   ;  

//**************************************************  

     cp5.addButton("A72")
   .setPosition(710,70)
   .setSize(40,20)
   .setValue(0)
   .setLabel("CLOSE")
   ;  
   
  cp5.addButton("A71")
   .setPosition(600,70)
   .setSize(40,20)
   .setValue(0)
   .setLabel("OPEN")
   ;   

//**************************************************  

  cp5.addButton("ZERO")
   .setPosition(360,410)
   .setSize(80,50)
   .setValue(0)
   .setLabel("ZERO POSITION")
   ;  

//**************************************************  

  cp5.addButton("SAVEPOS1")
   .setPosition(30,410)
   .setSize(80,20)
   .setValue(0)
   .setLabel("SAVE POSITION 1")
   ;  
   
//**************************************************  

  cp5.addButton("GOTOPOS1")
   .setPosition(30,440)
   .setSize(80,20)
   .setValue(0)
   .setLabel("GO POS1")
   ;     

//**************************************************  

  cp5.addButton("SAVEPOS2")
   .setPosition(200,410)
   .setSize(80,20)
   .setValue(0)
   .setLabel("SAVE POSITION 2")
   ;  
   
//**************************************************  

  cp5.addButton("GOTOPOS2")
   .setPosition(200,440)
   .setSize(80,20)
   .setValue(0)
   .setLabel("GO POS2")
   ; 

//**************************************************  

  cp5.addButton("SAVEPOS3")
   .setPosition(530,410)
   .setSize(80,20)
   .setValue(0)
   .setLabel("SAVE POSITION 3")
   ;  
   
//**************************************************  

  cp5.addButton("GOTOPOS3")
   .setPosition(530,440)
   .setSize(80,20)
   .setValue(0)
   .setLabel("GO POS3")
   ; 

//**************************************************  

  cp5.addButton("SAVEPOS4")
   .setPosition(680,410)
   .setSize(80,20)
   .setValue(0)
   .setLabel("SAVE POSITION 4")
   ;  
   
//**************************************************  

  cp5.addButton("GOTOPOS4")
   .setPosition(680,440)
   .setSize(80,20)
   .setValue(0)
   .setLabel("GO POS4")
   ; 
   
//**************************************************  

  cp5.addButton("salir")
   .setPosition(0,0)
   .setSize(20,20)
   .setValue(0)
   .setLabel("X")
   ;
   
ZERO();
}

//**************************************************




void draw () 
{
if (seleccion == false)
{
   textSize(15);
  fill(0,0,0);//negro
  text ("ART 1" , 5, 380);
  text ("ART 2" , 5 , 310);
  text ("ART 3" , 5 , 240);
  text ("ART 4" , 95 , 15);
  text ("ART 5" , 270 , 15);
  text ("GRIPPER ROTATION" , 390 , 15);
  text ("GRIPPER OPEN/CLOSE" , 590 ,15);
} 
}


//**************************************************

void GOTOPOS1()
{
  if (inicio==false)
  {  
  String[] lines = loadStrings("pos1.txt");
  for (int i=0 ; i<lines.length; i++){
    //myPort.write(lines[i]);
    //myPort.write('\n');
    if (i==0) // G0 Axxx
    {
      String linea = lines[0];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      println (dato2);
      print("A = ");
      println(dato2);
      A1pos = dato2;      
    }
    if (i==1) // G0 Bxxx Cxxx
    {
      String linea = lines[1];
      println (linea);
      int posicionC = linea.indexOf("C");
      String datoB = linea.substring(4, posicionC);
      String datoC = linea.substring(posicionC+1,linea.length());
      int datoB2 = int(datoB);
      int datoC2 = int(datoC);
      print("B = ");
      println(datoB);
      print("C = ");
      println(datoC);
      print ("datoB2 = ");
      println (datoB2);
      print ("datoC2 = ");
      println (datoC2);
      A2pos = datoC2;      
    }
    if (i==2) // G0 Dxxx
    {
      String linea = lines[2];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      print("D =");
      println(dato2);
      A3pos = dato2;      
    }
    if (i==3) // G0 Xxxx
    {
      String linea = lines[3];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      print ("X =");
      println (dato2);
      A4pos = dato2;      
    }
    if (i==4) // G0 Yxxx Zxxx
    {
      String linea = lines[4];
      println (linea);
      int posicionZ = linea.indexOf("Z");
      String datoY = linea.substring(4, posicionZ);
      String datoZ = linea.substring(posicionZ+1,linea.length());
      int dato2=int(datoZ);
      print("Y =");
      println(datoY);
      print("Z =");
      print(datoZ);
      A5pos = dato2;      
    }    
    if (i==5) // G0 Yxxx -Zxxx
    { 
      String linea = lines[5];
      println (linea);
      int posicionZ = linea.indexOf("Z");
      String datoY = linea.substring(4, posicionZ);
      String datoZ = linea.substring(posicionZ+1,linea.length());
      int dato2=int(datoZ);
      print("Y =");
      println(datoY);
      print("Z =");
      print(datoZ);    
      A6pos = dato2*(-1);     
    } 
    if (i==6) // G0 M3 Sxxx
    {
      String linea = lines[6];
      println (linea);
      int posicionS = linea.indexOf("S");
      String datoS = linea.substring(posicionS+1, linea.length());
      print ("datoS = ");
      println (datoS);
      int dato2=int(datoS);
      print("S =");
      println(datoS);
      A7pos = dato2;     
    }  
  }
  }

  
  myPort.write("G0 "+ "A" + A1pos + "B" + A2pos + " C" + A2pos + " D" + A3pos + " X" + A4pos + " Y" + A5pos + " Z" + A5pos );
  myPort.write ('\n' );
 // myPort.write ("G0 " + "Y" + A6pos + " Z" + A6pos*(-1));
  myPort.write ('\n' );
  myPort.write ("G0 M3 S" + A7pos);
  myPort.write ('\n' ); 
  
  cp5.getController("slider1").setValue(A1pos);
  cp5.getController("slider2").setValue(A2pos);
  cp5.getController("slider3").setValue(A3pos);
  cp5.getController("slider4").setValue(A4pos);
  cp5.getController("slider5").setValue(A5pos);
  cp5.getController("slider6").setValue(A6pos);
  cp5.getController("slider7").setValue(A7pos);
  
  }


//**************************************************

void SAVEPOS1()
{
  if (inicio==false)
  {  
  String pos1=( "G0 " + "A"+(A1pos) + '\n' + "G0 "+ "B"+ (A2pos)+ " C" + (A2pos) + '\n' + "G0 "+ "D" + (A3pos) + '\n' + "G0 "+ "X" + (A4pos) + '\n' + "G0 "+ "Y" + (A5pos) + " Z" + (A5pos)+ '\n' + "G0 Y"+(A6pos)+" Z"+(A6pos*(-1))+ '\n' + "G0 "+ "M3 S"+(A7pos) );
  String[] list = split(pos1, '\n' );
  saveStrings("pos1.txt", list);
  }
}
//**************************************************



void GOTOPOS2()
{
  if (inicio==false)
  {  
  String[] lines = loadStrings("pos2.txt");
  for (int i=0 ; i<lines.length; i++){
    //myPort.write(lines[i]);
    //myPort.write('\n');
    if (i==0) // G0 Axxx
    {
      String linea = lines[0];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      println (dato2);
      print("A = ");
      println(dato2);
      A1pos = dato2;      
    }
    if (i==1) // G0 Bxxx Cxxx
    {
      String linea = lines[1];
      println (linea);
      int posicionC = linea.indexOf("C");
      String datoB = linea.substring(4, posicionC);
      String datoC = linea.substring(posicionC+1,linea.length());
      int datoB2 = int(datoB);
      int datoC2 = int(datoC);
      print("B = ");
      println(datoB);
      print("C = ");
      println(datoC);
      print ("datoB2 = ");
      println (datoB2);
      print ("datoC2 = ");
      println (datoC2);
      A2pos = datoC2;      
    }
    if (i==2) // G0 Dxxx
    {
      String linea = lines[2];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      print("D =");
      println(dato2);
      A3pos = dato2;      
    }
    if (i==3) // G0 Xxxx
    {
      String linea = lines[3];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      print ("X =");
      println (dato2);
      A4pos = dato2;      
    }
    if (i==4) // G0 Yxxx Zxxx
    {
      String linea = lines[4];
      println (linea);
      int posicionZ = linea.indexOf("Z");
      String datoY = linea.substring(4, posicionZ);
      String datoZ = linea.substring(posicionZ+1,linea.length());
      int dato2=int(datoZ);
      print("Y =");
      println(datoY);
      print("Z =");
      print(datoZ);
      A5pos = dato2;      
    }    
    if (i==5) // G0 Yxxx -Zxxx
    { 
      String linea = lines[5];
      println (linea);
      int posicionZ = linea.indexOf("Z");
      String datoY = linea.substring(4, posicionZ);
      String datoZ = linea.substring(posicionZ+1,linea.length());
      int dato2=int(datoZ);
      print("Y =");
      println(datoY);
      print("Z =");
      print(datoZ);
      A6pos = dato2*(-1);     
    } 
    if (i==6) // G0 M3 Sxxx
    {
      String linea = lines[6];
      println (linea);
      int posicionS = linea.indexOf("S");
      String datoS = linea.substring(posicionS+1, linea.length());
      print ("datoS = ");
      println (datoS);
      int dato2=int(datoS);
      print("S =");
      println(datoS);
      A7pos = dato2;     
    }  
  }
  }
  
  
  myPort.write("G0 "+ "A" + A1pos + "B" + A2pos + " C" + A2pos + " D" + A3pos + " X" + A4pos + " Y" + A5pos + " Z" + A5pos );
  myPort.write ('\n' );
 // myPort.write ("G0 " + "Y" + A6pos + " Z" + A6pos*(-1));
  myPort.write ('\n' );
  myPort.write ("G0 M3 S" + A7pos);
  myPort.write ('\n' ); 
  cp5.getController("slider1").setValue(A1pos);
  cp5.getController("slider2").setValue(A2pos);
  cp5.getController("slider3").setValue(A3pos);
  cp5.getController("slider4").setValue(A4pos);
  cp5.getController("slider5").setValue(A5pos);
  cp5.getController("slider6").setValue(A6pos);
  cp5.getController("slider7").setValue(A7pos);
}

//**************************************************
void SAVEPOS2()
{
  if (inicio==false)
  {  
  String pos2=( "G0 " + "A"+(A1pos) + '\n' + "G0 "+ "B"+ (A2pos)+ " C" + (A2pos) + '\n' + "G0 "+ "D" + (A3pos) + '\n' + "G0 "+ "X" + (A4pos) + '\n' + "G0 "+ "Y" + (A5pos) + " Z" + (A5pos)+ '\n' + "G0 Y"+(A6pos)+" Z"+(A6pos*(-1))+ '\n' + "G0 "+ "M3 S"+(A7pos) );
  String[] list = split(pos2, '\n' );
  saveStrings("pos2.txt", list);
  }
}

//**************************************************
void GOTOPOS3()
{
  if (inicio==false)
  {  
  String[] lines = loadStrings("pos3.txt");
  for (int i=0 ; i<lines.length; i++){
    //myPort.write(lines[i]);
    //myPort.write('\n');
    if (i==0) // G0 Axxx
    {
      String linea = lines[0];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      println (dato2);
      print("A = ");
      println(dato2);
      A1pos = dato2;      
    }
    if (i==1) // G0 Bxxx Cxxx
    {
      String linea = lines[1];
      println (linea);
      int posicionC = linea.indexOf("C");
      String datoB = linea.substring(4, posicionC);
      String datoC = linea.substring(posicionC+1,linea.length());
      int datoB2 = int(datoB);
      int datoC2 = int(datoC);
      print("B = ");
      println(datoB);
      print("C = ");
      println(datoC);
      print ("datoB2 = ");
      println (datoB2);
      print ("datoC2 = ");
      println (datoC2);
      A2pos = datoC2;      
    }
    if (i==2) // G0 Dxxx
    {
      String linea = lines[2];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      print("D =");
      println(dato2);
      A3pos = dato2;      
    }
    if (i==3) // G0 Xxxx
    {
      String linea = lines[3];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      print ("X =");
      println (dato2);
      A4pos = dato2;      
    }
    if (i==4) // G0 Yxxx Zxxx
    {
      String linea = lines[4];
      println (linea);
      int posicionZ = linea.indexOf("Z");
      String datoY = linea.substring(4, posicionZ);
      String datoZ = linea.substring(posicionZ+1,linea.length());
      int dato2=int(datoZ);
      print("Y =");
      println(datoY);
      print("Z =");
      print(datoZ);
      A5pos = dato2;      
    }    
    if (i==5) // G0 Yxxx -Zxxx
    { 
      String linea = lines[5];
      println (linea);
      int posicionZ = linea.indexOf("Z");
      String datoY = linea.substring(4, posicionZ);
      String datoZ = linea.substring(posicionZ+1,linea.length());
      int dato2=int(datoZ);
      print("Y =");
      println(datoY);
      print("Z =");
      print(datoZ);
      A6pos = dato2*(-1);     
    } 
    if (i==6) // G0 M3 Sxxx
    {
      String linea = lines[6];
      println (linea);
      int posicionS = linea.indexOf("S");
      String datoS = linea.substring(posicionS+1, linea.length());
      print ("datoS = ");
      println (datoS);
      int dato2=int(datoS);
      print("S =");
      println(datoS);
      A7pos = dato2;     
    }  
  }
  }
    myPort.write("G0 "+ "A" + A1pos + "B" + A2pos + " C" + A2pos + " D" + A3pos + " X" + A4pos + " Y" + A5pos + " Z" + A5pos );
  myPort.write ('\n' );
 // myPort.write ("G0 " + "Y" + A6pos + " Z" + A6pos*(-1));
  myPort.write ('\n' );
  myPort.write ("G0 M3 S" + A7pos);
  myPort.write ('\n' );  
  
  cp5.getController("slider1").setValue(A1pos);
  cp5.getController("slider2").setValue(A2pos);
  cp5.getController("slider3").setValue(A3pos);
  cp5.getController("slider4").setValue(A4pos);
  cp5.getController("slider5").setValue(A5pos);
  cp5.getController("slider6").setValue(A6pos);
  cp5.getController("slider7").setValue(A7pos);
}

//**************************************************
void SAVEPOS3()
{
  if (inicio==false)
  {  
  String pos3=( "G0 " + "A"+(A1pos) + '\n' + "G0 "+ "B"+ (A2pos)+ " C" + (A2pos) + '\n' + "G0 "+ "D" + (A3pos) + '\n' + "G0 "+ "X" + (A4pos) + '\n' + "G0 "+ "Y" + (A5pos) + " Z" + (A5pos)+ '\n' + "G0 Y"+(A6pos)+" Z"+(A6pos*(-1))+ '\n' + "G0 "+ "M3 S"+(A7pos) );
  String[] list = split(pos3, '\n' );
  saveStrings("pos3.txt", list);
  }
}
//**************************************************



void GOTOPOS4()
{
  if (inicio==false)
  {  
  String[] lines = loadStrings("pos4.txt");
  for (int i=0 ; i<lines.length; i++){
    //myPort.write(lines[i]);
    //myPort.write('\n');
    if (i==0) // G0 Axxx
    {
      String linea = lines[0];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      println (dato2);
      print("A = ");
      println(dato2);
      A1pos = dato2;      
    }
    if (i==1) // G0 Bxxx Cxxx
    {
      String linea = lines[1];
      println (linea);
      int posicionC = linea.indexOf("C");
      String datoB = linea.substring(4, posicionC);
      String datoC = linea.substring(posicionC+1,linea.length());
      int datoB2 = int(datoB);
      int datoC2 = int(datoC);
      print("B = ");
      println(datoB);
      print("C = ");
      println(datoC);
      print ("datoB2 = ");
      println (datoB2);
      print ("datoC2 = ");
      println (datoC2);
      A2pos = datoC2;      
    }
    if (i==2) // G0 Dxxx
    {
      String linea = lines[2];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      print("D =");
      println(dato2);
      A3pos = dato2;      
    }
    if (i==3) // G0 Xxxx
    {
      String linea = lines[3];
      println (linea);
      String dato = linea.substring(4,linea.length());
      int dato2 = int(dato);
      print ("X =");
      println (dato2);
      A4pos = dato2;      
    }
    if (i==4) // G0 Yxxx Zxxx
    {
      String linea = lines[4];
      println (linea);
      int posicionZ = linea.indexOf("Z");
      String datoY = linea.substring(4, posicionZ);
      String datoZ = linea.substring(posicionZ+1,linea.length());
      int dato2=int(datoZ);
      print("Y =");
      println(datoY);
      print("Z =");
      print(datoZ);
      A5pos = dato2;      
    }    
    if (i==5) // G0 Yxxx -Zxxx
    { 
      String linea = lines[5];
      println (linea);
      int posicionZ = linea.indexOf("Z");
      String datoY = linea.substring(4, posicionZ);
      String datoZ = linea.substring(posicionZ+1,linea.length());
      int dato2=int(datoZ);
      print("Y =");
      println(datoY);
      print("Z =");
      print(datoZ);
      A6pos = dato2*(-1)*2;     
    } 
    if (i==6) // G0 M3 Sxxx
    {
      String linea = lines[6];
      println (linea);
      int posicionS = linea.indexOf("S");
      String datoS = linea.substring(posicionS+1, linea.length());
      print ("datoS = ");
      println (datoS);
      int dato2=int(datoS);
      print("S =");
      println(datoS);
      A7pos = dato2;     
    }  
  }
  }
  myPort.write("G0 "+ "A" + A1pos + "B" + A2pos + " C" + A2pos + " D" + A3pos + " X" + A4pos + " Y" + A5pos + " Z" + A5pos );
  myPort.write ('\n' );
  //myPort.write ("G0 " + "Y" + A6pos + " Z" + A6pos*(-1));
  myPort.write ('\n' );
  myPort.write ("G0 M3 S" + A7pos);
  myPort.write ('\n' ); 
  
  cp5.getController("slider1").setValue(A1pos);
  cp5.getController("slider2").setValue(A2pos);
  cp5.getController("slider3").setValue(A3pos);
  cp5.getController("slider4").setValue(A4pos);
  cp5.getController("slider5").setValue(A5pos);
  cp5.getController("slider6").setValue(A6pos);
  cp5.getController("slider7").setValue(A7pos);
}
//**************************************************

void SAVEPOS4()
{
  if (inicio==false)
  {  
  String pos4=( "G0 " + "A"+(A1pos) + '\n' + "G0 "+ "B"+ (A2pos)+ " C" + (A2pos) + '\n' + "G0 "+ "D" + (A3pos) + '\n' + "G0 "+ "X" + (A4pos) + '\n' + "G0 "+ "Y" + (A5pos) + " Z" + (A5pos)+ '\n' + "G0 Y"+(A6pos)+" Z"+(A6pos*(-1))+ '\n' + "G0 "+ "M3 S"+(A7pos) );
  String[] list = split(pos4, '\n' );
  saveStrings("pos4.txt", list);
  }
  inicio=false;
}


//**************************************************      
     
void slider1(int posicionA1) {
  A1pos = posicionA1;
  println("G0 A"+(posicionA1));
  myPort.write("G0 A"+(posicionA1));
  myPort.write('\n');
  myPort.clear();
}

void slider2(int posicionA2) {
  A2pos = posicionA2;
  println("G0 B"+(posicionA2)+ " C" + (posicionA2));
  myPort.write("G0 B"+(posicionA2)+ " C" + (posicionA2));
  myPort.write('\n');
  myPort.clear();
}

void slider3(int posicionA3) {
  A3pos = posicionA3;
  println("G0 D"+(posicionA3));
  myPort.write("G0 D"+(posicionA3));
  myPort.write('\n');
  myPort.clear();
}

void slider4(int posicionA4) {
  A4pos = posicionA4;
  println("G0 X"+(posicionA4));
  myPort.write("G0 X"+(posicionA4));
  myPort.write('\n');
  myPort.clear();
}

void slider5(int posicionA5) {
  A5pos = posicionA5;
  println("G0 Y"+(posicionA5)+" Z"+(posicionA5));
  myPort.write("G0 Y"+(posicionA5)+" Z"+(posicionA5));
  myPort.write('\n');
  myPort.clear();
}

void slider6(int posicionA6) {
  A6pos = posicionA6*2;
  println("G0 Y"+(posicionA6)+" Z"+(posicionA6*(-1)));
  myPort.write("G0 Y"+(posicionA6)+" Z"+(posicionA6*(-1)));
  myPort.write('\n');
  myPort.clear();
}

void slider7(int posicionA7) {
  A7pos = posicionA7;
  println("M3 S"+(posicionA7));
  myPort.write("M3 S"+(posicionA7));
  myPort.write('\n');
  myPort.clear();
}

void ZERO()
{
  myPort.write("G0 A0 B0 C0 D0 X0 Y0 Z0");
  myPort.write('\n');
  myPort.clear();  
  cp5.getController("slider1").setValue(0);
  A1pos = 0;
  cp5.getController("slider2").setValue(0);
  A2pos = 0;
  cp5.getController("slider3").setValue(0);
  A3pos = 0; 
  cp5.getController("slider4").setValue(0);
  A4pos = 0;
  cp5.getController("slider5").setValue(0);
  A5pos = 0;
  cp5.getController("slider6").setValue(0);
  A6pos = 0;
  cp5.getController("slider7").setValue(0);
  A7pos = 0;  
}
//************************************************** 

void A11()
{
  cp5.getController("slider1").setValue(0);
  A1pos = 0;
}

void A12()
{
  cp5.getController("slider1").setValue(90);
  A1pos = 90;
}

void A13()
{
  cp5.getController("slider1").setValue(180);
  A1pos = 180;
}

void A14()
{
  cp5.getController("slider1").setValue(-90);
  A1pos = -90;
}

void A15()
{
  cp5.getController("slider1").setValue(-180);
  A1pos = -180;
}


//************************************************** 

void A21()
{
  cp5.getController("slider2").setValue(0);
  A2pos = 0;
}

void A22()
{
  cp5.getController("slider2").setValue(45);
  A2pos = 45;
}

void A23()
{
  cp5.getController("slider2").setValue(90);
  A2pos = 90;
}

void A24()
{
  cp5.getController("slider2").setValue(-45);
  A2pos = -45;
}

void A25()
{
  cp5.getController("slider2").setValue(-90);
  A2pos = -90;
}

//************************************************** 

void A31()
{
  cp5.getController("slider3").setValue(0);
}

void A32()
{
  cp5.getController("slider3").setValue(45);
}

void A33()
{
  cp5.getController("slider3").setValue(90);
}

void A34()
{
  cp5.getController("slider3").setValue(-45);
}

void A35()
{
  cp5.getController("slider3").setValue(-90);
}

//************************************************** 

void A41()
{
  cp5.getController("slider4").setValue(0);
}

void A42()
{
  cp5.getController("slider4").setValue(90);
}

void A43()
{
  cp5.getController("slider4").setValue(180);
}

void A44()
{
  cp5.getController("slider4").setValue(-90);
}

void A45()
{
  cp5.getController("slider4").setValue(-180);
}

//************************************************** 

void A51()
{
  cp5.getController("slider5").setValue(0);
}

void A52()
{
  cp5.getController("slider5").setValue(45);
}

void A53()
{
  cp5.getController("slider5").setValue(90);
}

void A54()
{
  cp5.getController("slider5").setValue(-45);
}

void A55()
{
  cp5.getController("slider5").setValue(-90);
}

//************************************************** 

void A61()
{
  cp5.getController("slider6").setValue(0);
}

void A62()
{
  cp5.getController("slider6").setValue(90);
}

void A63()
{
  cp5.getController("slider6").setValue(180);
}

void A64()
{
  cp5.getController("slider6").setValue(-90);
}

void A65()
{
  cp5.getController("slider6").setValue(-180);
}

//************************************************** 

void A71()
{
  cp5.getController("slider7").setValue(0);
}

void A72()
{
  cp5.getController("slider7").setValue(255);
}


void serialEvent (Serial myPort)
{

 
}


void mousePressed()
{
if (seleccion == true)
{
if(mouseX >50 && mouseX<600 && mouseY>120 && mouseY<150)
{
  puerto=0;
  setup2();
} 

 
if(mouseX >50 && mouseX<600 && mouseY>160 && mouseY<190)
{
 puerto=1;
 setup2(); 
} 

 
if(mouseX >50 && mouseX<600 && mouseY>200 && mouseY<230)
{
 puerto=2;
 setup2();   
}
  
if(mouseX >50 && mouseX<600 && mouseY>240 && mouseY<270)
{
 puerto=3;
 setup2(); 
} 
if(mouseX >50 && mouseX<600 && mouseY>280 && mouseY<310)
{
 puerto=4;
 setup2(); 
}
if(mouseX >50 && mouseX<600 && mouseY>320 && mouseY<350)
{
 puerto=5;
 setup2(); 
} 
}
else
{
 if(mouseX >0 && mouseX<20 && mouseY>0 && mouseY<20)
{
exit();
}  
}
}




void keyPressed() 
{
 
if (key == '0')
  {
    puerto=0;
    setup2();
  }
if (key == '1')
  {
    puerto=1;
    setup2();
  }
if (key == '2')
  {
    puerto=2;
    setup2();
  }
if (key == '3')
  {
    puerto=3;
    setup2();
  }
if (key == '4')
  {
    puerto=4;
    setup2();
  }
if (key == '5')
  {
    puerto=5;
    setup2();
  } 
if (key == '6')
  {
    puerto=6;
    setup2();
  }
if (key == '7')
  {
    puerto=7;
    setup2();
  } 
if (key == '8')
  {
    puerto=8;
    setup2();
  }
if (key == '9')
  {
    puerto=9;
    setup2();
  }  
}
