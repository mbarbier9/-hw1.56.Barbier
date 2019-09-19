import controlP5.*;

ControlP5 cp5;
PImage img;
PImage flr1I;
PImage flr2I;
PImage flr3I;
PImage flr4I;

PImage firstI;

PImage[] arrayI = new PImage[4];

int count = 60;
int countS = 0;
int floor = 0;
int floorA = 0;

void setup() {
  size(800,720);
  cp5 = new ControlP5(this);
  img = loadImage("wood.jpg");
  background(color(255));
  
  //Floor button images
  PImage[] flr1 = {loadImage("1-w.png"),loadImage("1-g.png")};
  PImage[] flr2 = {loadImage("2-w.png"),loadImage("2-g.png")};
  PImage[] flr3 = {loadImage("3-w.png"),loadImage("3-g.png")};
  PImage[] flr4 = {loadImage("4-w.png"),loadImage("4-g.png")};
  
  //Bell and call images
  PImage[] bellI = {loadImage("bell-w.png"),loadImage("bell.png")};
  PImage[] callI = {loadImage("call-w.png"),loadImage("call.png")};
  
  //Open door
  PImage[] openD = {loadImage("open-g.png"),loadImage("open-g.png"),loadImage("open.png")};
  cp5.addButton("open")
     .setPosition(300,430)
     .setImages(openD)
     .updateSize();
 
 //Close door
  PImage[] closeD = {loadImage("close-g.png"),loadImage("close-g.png"),loadImage("close-r.png")};
  cp5.addButton("close")
     .setPosition(300,560)
     .setImages(closeD)
     .updateSize();
  
  
  arrayI[0] = loadImage("FLR1.png");
  arrayI[1] = loadImage("FLR2.png");
  arrayI[2] = loadImage("FLR3.png");
  arrayI[3] = loadImage("FLR4.png");

  
  cp5.addSlider("slider")
  .setPosition(200,60)
  .setSize(70,600)
  .setRange(0,300)
  .setValue(countS)
  .setColorBackground(color(255))
  .setColorForeground(#77E854);
  
  //Bell
  cp5.addToggle("bell")
  .setPosition(30,245)
  .setSize(150,150)
  .setImages(bellI)
  .updateSize();
  
  //Call
  cp5.addToggle("call")
  .setPosition(30,420)
  .setSize(150,150)
  .setImages(callI)
  .updateSize();
     
  //Floor 3
  cp5.addToggle("2")
  .setPosition(330,60)
  .setSize(150,150)
  .setImages(flr3)
  .updateSize();
  
  //Floor 1
  cp5.addToggle("0")
  .setPosition(330,240)
  .setSize(150,150)
  .setImages(flr1)
  .updateSize();
  
  //Floor 4
  cp5.addToggle("3")
  .setPosition(530,60)
  .setSize(150,150)
  .setImages(flr4)
  .updateSize();
  
  //Floor 2
  cp5.addToggle("1")
  .setPosition(530,240)
  .setSize(150,150)
  .setImages(flr2)
  .updateSize();

}

void draw(){
  //textSize(64);
  //text("FLR ", 30, 110);
  //fill(0);
  
  background(255); 
  rect(196, 58, 77, 604);
  image(arrayI[floorA],30,50);
  
  cp5.getController("slider").setValue(countS);
  
  elevateFloor();
  changeFloor();
}

public void controlEvent(ControlEvent theEvent) {
  String valueS = theEvent.getController().getName().toString();
  //println(valueS);
  
  if (valueS.equals("0")||valueS.equals("1")||valueS.equals("2")||valueS.equals("3")){
      int valueI = Integer.parseInt(valueS);
      println(valueI);
      
      floor = valueI*100;
      println(floor);
  }
}

public void changeFloor(){
    if((countS%100)==0){
    int button = countS/100;
    if(countS==floor){
      cp5.getController(Integer.toString(button)).setValue(0);
      floorA = button;
    }
    
  }
}

public void elevateFloor(){
    if(floor>countS){
      countS = countS+1;
  }
    if(floor<countS){
      countS = countS-1;
  }

}

//public void elevate(){
//  int button = floor/100;
  
//      if(floor>countS){
//    while(countS!=floor){
//      countS = countS+1;
//      delay(10);
//    }
//  }
//    if(floor<countS){
//    while(countS!=floor){
//      countS = countS-1;
//    }
//  }
//   cp5.getController(Integer.toString(button));
//}
