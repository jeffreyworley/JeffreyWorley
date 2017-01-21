Lines[] myLines = new Lines[10];

void setup() {
  frameRate(20);
  background(25);
  size(640, 500, P3D);
  for (int i = 0; i < myLines.length; i++) {
    myLines[i] = new Lines(random(width), random(height), random(-100, -50), random(255), random(255), random(255), random(2, 20));
  }
}

void draw() {
  
  for (int i = 0; i < myLines.length; i++) {
    Lines iLines = myLines[i];
    iLines.display();
  }

  if (frameCount >= 500) {
    background(25);
    frameCount = 0;
  }

}

class Lines {
  // class variables
  float xpos; 
  float ypos;
  float zpos;
  float strk1, strk2, strk3;
  float pointCount;
  float strokeW;
  float linelength;

  // Constructor
  Lines(float tempX, float tempY, float tempZ, float tStrk1, float tStrk2, float tStrk3, float tempCount) {
    xpos = tempX;
    ypos = tempY;
    zpos = tempZ;
    strk1 = tStrk1;
    strk2 = tStrk2;
    strk3 = tStrk3;
    pointCount = tempCount;
  }

  // display 
  void display() {

    strokeW = random(4, 5);
    pointCount = random(1, 50);

    if (xpos > width || xpos < 0 || ypos > height || ypos < 0) {
      xpos = random(width);
      ypos = random(height);
      zpos = random(-100, -50);
      strk1 = random(255);
      strk2 = random(255);
      strk3 = random(255);
      strokeW = random(4, 5);
      strokeWeight(strokeW);
    } else {
      if (random(100) > 70) {
        //strokeWeight(strokeW);
        stroke(strk1, strk2, strk3);
        moveLeft(xpos, ypos, pointCount, zpos);
      } else if (random(100) > 65) {
        //strokeWeight(strokeW);
        stroke(strk1, strk2, strk3);
        moveDown(xpos, ypos, pointCount, zpos);
      } else if (random(100) > 55) {
        //strokeWeight(strokeW);
        stroke(strk1, strk2, strk3);
        moveUp(xpos, ypos, pointCount, zpos);
      } else if (random(100) > 45) {
        //float strokeW2 = strokeW - 1;
        //strokeWeight(strokeW2);
        stroke(strk1 - 70, strk2 - 70, strk3 - 70);
        moveBack(xpos, ypos, pointCount, zpos);
        //strokeWeight(strokeW);
        stroke(strk1, strk2, strk3);
      } else if (random(100) > 35) {
        //float strokeW2 = strokeW + 1;
        //strokeWeight(strokeW2);
        stroke(strk1 - 70, strk2 - 70, strk3 - 70);
        moveForward(xpos, ypos, pointCount, zpos);
        //strokeWeight(strokeW);
        stroke(strk1, strk2, strk3);
      } else {
        //strokeWeight(strokeW);
        stroke(strk1, strk2, strk3);
        moveRight(xpos, ypos, pointCount, zpos);
      }
    }
  }

  void moveRight(float startX, float startY, float moveCount, float startZ) {
    for (float i = 0; i < moveCount; i += .25) {
      point(startX + i, startY, startZ);
      xpos = startX + i;
      ypos = startY;
      zpos = startZ;
    }
  }

  void moveLeft(float startX, float startY, float moveCount, float startZ) {
    for (float i = 0; i < moveCount; i += .25) {
      point(startX - i, startY, startZ);
      xpos = startX - i;
      ypos = startY;
      zpos = startZ;
    }
  }

  void moveUp(float startX, float startY, float moveCount, float startZ) {
    for (float i = 0; i < moveCount; i += .25) {
      point(startX, startY - i, startZ);
      xpos = startX;
      ypos = startY - i;
      zpos = startZ;
    }
  }

  void moveDown(float startX, float startY, float moveCount, float startZ) {
    for (float i = 0; i < moveCount; i += .25) {
      point(startX, startY + i, startZ);
      xpos = startX;
      ypos = startY + i;
      zpos = startZ;
    }
  }


  void moveBack(float startX, float startY, float moveCount, float startZ) {
    for (float i = 0; i < moveCount; i += .1) {
      point(startX, startY, startZ - i);
      xpos = startX;
      ypos = startY;
      zpos = startZ - i;
    }
  } 

  void moveForward(float startX, float startY, float moveCount, float startZ) {
    for (float i = 0; i < moveCount; i += .01) {
      point(startX, startY, startZ + i);
      xpos = startX;
      ypos = startY;
      zpos = startZ + i;
    }
  }
}
