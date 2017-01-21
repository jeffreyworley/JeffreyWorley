float i, s, s1;
String userInput = "Type a number here to check that value";
void setup () {
  size(1000, 600, P3D);
  background(150);
}

void draw() {
  background(150);
  textLines();
  sVal();
  rLine();
  float circumference = circumFinder(s);
  float sArea = areaFinder(s);
  float sVol = sphereVolume(s);
  text(s, 50, 485);
  text(circumference, 150, 485);
  text(sArea, 275, 485);
  text( sVol, 380, 485);
  credText();
  drawSphere();
}

void drawSphere () {
  translate(width/2, 200, 0);
  noStroke();
  lights();
  sphere(s);
}
void textLines () {
  stroke(10);
  textSize(15);
  // circumference text
  text ("circumference", 150, 450);
  line (150, 455, 235, 455);
  // Radius Text
  text ("Radius", 50, 450);
  line (50, 455, 100, 455);
  // surface area text 
  text("Surface Area", 275, 450);
  line(275, 455, 350, 455);
  // volume text
  text("Volume", 380, 450);
  line(380, 455, 420, 455);
}

void credText () {
  fill(255);
  textSize(25);
  text("Sphere conversion", 25, 25);
  textSize(15);
  text("Move mouse along line to get \ndifferent values for the radius. \nWorks for any measurement unit. \nMade by Jeffrey Worley.", 600, 500);
}

void rLine () {
  i = 0;
  int rep = 0;
  float x = 25;
  stroke(5);
  line(25, 400, 975, 400);
  // tick marks
  while (i < 980) {
    line(x, 390, x, 410);
    rep = rep + 1;
    i = 0;
     x = x + 47.5;
     i = i + x; 
   text(rep * 10, x - 15, 420);  
  }
}

float circumFinder (float rad) {
  float circum = 2 * 3.14 * rad;
  return circum;
}

float areaFinder (float rad) {
  float area = 4 * 3.14 * rad;
  return area;
}

float sphereVolume (float rad) {
  float vol = (4 * 3.14 * (rad* rad* rad)) / 3;
  return vol;
}

void keyPressed() {
  if (keyCode == BACKSPACE) {
    if (userInput.length() > 0) {
      userInput = userInput.substring(0, userinput.length()-1);
    } 
  } else if (keyCode == DELETE) {}
}

void sVal () {
  s1 = (mouseX / 5) - 4;
  if (s1 <= 20) {
    s = s1;
  } else if (s1 <= 48) {
    s = s1 + 1;
  } else if (s1 <= 70) {
    s = s1 + 2;
  } else if (s1 <= 89) {
    s = s1 + 3;
  } else if (s1 <= 110) {
    s = s1 + 4;
  } else if (s1 <= 130) {
    s = s1 + 5;
  } else if (s1 <= 150) {
    s = s1 + 6;
  } else if (s1 <= 170) {
    s = s1 + 7;
  } else if (s1 <= 190) {
    s = s1 + 9;
  } else if (s1 <= 210) {
    s = s1 + 10;
  }
  s = s;
}


