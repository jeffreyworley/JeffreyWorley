/* Jeffrey Worley. Basic Calculator.*/

String displayValue = "0";
String displayValue2 = "";
String valueToCompute = "";
String valueToCompute2 = "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
char opValue;
boolean firstNum;
float result;
boolean more = false;
// number buttons array
Button[] calcButtons = new Button[10];
// sign buttons array 
Button[] opButtons = new Button[5];
//special buttons array
Button[] spButtons = new Button[7];
// more buttons
Button[] moreButtons = new Button[2];
// more special buttons
Button[] moreSPButtons = new Button[3];
// more op buttons
Button[] moreOPButtons = new Button[10];

void setup() {
  size(360, 330);
  fill(255);
  firstNum = true;

  // Number Buttons
  calcButtons[0] = new Button(30, 270).asNumber(0, 50, 40); //bNumber0
  calcButtons[1] = new Button(30, 220).asNumber(1, 50, 40); //bNumber1
  calcButtons[2] = new Button(90, 220).asNumber(2, 50, 40); //bNumber2
  calcButtons[3] = new Button(150, 220).asNumber(3, 50, 40); //bNumber3
  calcButtons[4] = new Button(30, 170).asNumber(4, 50, 40); //bNumber4
  calcButtons[5] = new Button(90, 170).asNumber(5, 50, 40); //bNumber5
  calcButtons[6] = new Button(150, 170).asNumber(6, 50, 40); //bNumber6
  calcButtons[7] = new Button(30, 120).asNumber(7, 50, 40); //bNumber7
  calcButtons[8] = new Button(90, 120).asNumber(8, 50, 40); //bNumber8
  calcButtons[9] = new Button(150, 120).asNumber(9, 50, 40); //bNumber9

  // symbols
  opButtons[0] = new Button(150, 270).asOperator("=", 50, 40, true, false); //bEquals
  opButtons[1] = new Button(210, 120).asOperator("÷", 120, 40, true, true ); //bDev
  opButtons[2] = new Button(210, 170).asOperator("X", 120, 40, true, true); //bMult
  opButtons[3] = new Button(210, 220).asOperator("-", 120, 40, true, true); //bMinus */
  opButtons[4] = new Button(210, 270).asOperator("+", 120, 40, true, true); //bPlus

  // specials
  spButtons[0] = new Button(90, 270).asSpecial(".", 50, 40, true); //bDecimal 
  spButtons[1] = new Button(285, 80).asSpecial("C", 40, 30, true); //bClr
  spButtons[2] = new Button(235, 80).asSpecial("U", 40, 30, true); //bUkno
  spButtons[3] = new Button(185, 80).asSpecial("π", 40, 30, true); //bpi 
  spButtons[4] = new Button(135, 80).asSpecial("±", 40, 30, true); //bPM
  spButtons[5] = new Button(85, 80).asSpecial("√", 40, 30, true); //bSQRT  
  spButtons[6] = new Button(35, 80).asSpecial("More", 40, 30, false); //uKnown

  //More 
  moreButtons[0] = new Button(185, 80).moreSpecial("(", 40, 30);
  moreButtons[1] = new Button(235, 80).moreSpecial(")", 40, 30);
  // more sp buttons
  moreSPButtons[0] = new Button(285, 80).asSpecial("C", 40, 30, true);
  moreSPButtons[1] = new Button(90, 270).asSpecial(".", 50, 40, true); //bDecimal 
  moreSPButtons[2] = new Button (270, 270).asSpecial("←", 50, 40, true);

  // more op buttons
  moreOPButtons[0] = new Button(150, 270).asOperator("=", 50, 40, true, false); //bEquals
  moreOPButtons[1] = new Button(210, 120).asOperator("÷", 50, 40, true, false); //bDev
  moreOPButtons[2] = new Button(210, 170).asOperator("X", 50, 40, true, false); //bMult
  moreOPButtons[3] = new Button(210, 220).asOperator("-", 50, 40, true, false); //bMinus */
  moreOPButtons[4] = new Button(210, 270).asOperator("+", 50, 40, true, false); //bPlus
  moreOPButtons[5] = new Button(135, 80 ).asOperator("Sin", 40, 30, false, false);
  moreOPButtons[6] = new Button(85, 80).asOperator("Cos", 40, 30, false, false);
  moreOPButtons[7] = new Button(35, 80).asOperator("Tan", 40, 30, false, false);
  moreOPButtons[8] = new Button(185, 80).asOperator("X^2", 40, 30, false, false);
  moreOPButtons[9] = new Button(235, 80).asOperator("^", 40, 30, false, false);
}


void draw() {

  // numbers display
  if (!more) {
    background(200);
    for (int i = 0; i < calcButtons.length; i++ ) {
      Button inumButton = calcButtons[i];
      inumButton.display();
    }
    updateDisplay();

    for (int i = 0; i < opButtons.length; i++) {
      Button iopButtons = opButtons[i];
      iopButtons.display();
    }
    for (int i = 0; i < spButtons.length; i++) {
      Button ispButtons = spButtons[i];
      ispButtons.display();
    }
  } else {

    background(200);
    // more buttons
    for (int i = 0; i < moreButtons.length; i++) {
      Button imoreButtons = moreButtons[i];
      imoreButtons.display();
    }
    // more operators
    for (int i = 0; i < moreOPButtons.length; i++) {
      Button imoreOPButtons = moreOPButtons[i];
      imoreOPButtons.display();
    }
    updateDisplay();
    for (int i = 0; i < calcButtons.length; i++ ) {
      Button inumButton = calcButtons[i];
      inumButton.display();
    }
    for (int i = 0; i < moreSPButtons.length; i++) {
      Button imoreSPButtons = moreSPButtons[i];
      imoreSPButtons.display();
    }
  }
}

void mousePressed() {

  // numerical buttons
  if (!more) {
    // calc buttons
    for (int i = 0; i < calcButtons.length; i++) {
      Button inumButtons = calcButtons[i];
      inumButtons.click();
      if (inumButtons.overBox) {
        if (firstNum) {
          //println(i + "" + inumButtons.numButtonValue);
          valueToCompute += int(inumButtons.numButtonValue);
          displayValue = valueToCompute;
        } else {
          valueToCompute2 += int(inumButtons.numButtonValue);
          displayValue = valueToCompute2;
        }
      }
    }
    // calc buttons ^^^ 

    // operator buttons
    for (int i = 0; i < opButtons.length; i++) {
      Button iopButton = opButtons[i];
      iopButton.click();
      if (iopButton.overBox) {
        if (iopButton.opButtonValue == "+") {
          if (result != 0) {
            opValue = '+';
            valueToCompute2 = "";
            firstNum = false;
            displayValue2 = "+";
          } else {
            opValue = '+';
            firstNum = false;
            displayValue2 = "+";
          }
        } else if (iopButton.opButtonValue == "=") {
          // perform calculation
          performCalculation();
          displayValue2 = "";
          firstNum = true;
        } else if (iopButton.opButtonValue == "-") {
          if (result != 0) {
            opValue = '-';
            valueToCompute2 = "";
            firstNum = false;
            displayValue2 = "-";
          } else {
            opValue = '-';
            firstNum = false;
            displayValue2 = "-";
          }
        } else if (iopButton.opButtonValue == "X") {
          if (result != 0) {
            opValue = 'X';
            valueToCompute2 = "";
            firstNum = false;
            displayValue2 = "X";
          } else {
            opValue = 'X';
            firstNum = false;
            displayValue2 = "X";
          }
        } else if (iopButton.opButtonValue == "÷") {
          if (result != 0) {
            opValue = '÷';
          } else 
            opValue = '÷';
          firstNum = false;
          displayValue2 = "÷";
        }
      }
    }
    // operator buttons ^^^

    //spbuttons
    for (int i = 0; i < spButtons.length; i++) {
      Button ispButtons = spButtons[i];
      ispButtons.click();
      if (ispButtons.overBox) {
        if (ispButtons.spButtonValue == "C") {
          displayValue = "0";
          displayValue2 = "";
          firstNum = true;
          valueToCompute = "";
          valueToCompute2 = "";
        } else if (ispButtons.spButtonValue == ".") {
          if (firstNum) {
            if (displayValue.contains(".")) {
              //does nothing
            } else {
              valueToCompute += ".";
              displayValue = valueToCompute;
            }
          } else {
            if (displayValue.contains(".")) {
            } else {
              valueToCompute2 += ".";
              displayValue = valueToCompute2;
            }
          }
        } else if (ispButtons.spButtonValue == "±") {
          if (firstNum) {
            if (int(displayValue) > 0) {
              valueToCompute = "-" + valueToCompute;
              displayValue = valueToCompute;
            } else if (int(displayValue) < 0) {
              String replacedValueToCompute = valueToCompute.replace("-", "");
              valueToCompute = replacedValueToCompute;
              displayValue = valueToCompute;
            }
          } else {
            if (int(displayValue) > 0) {
              valueToCompute2 = "-" + valueToCompute2;
              displayValue = valueToCompute2;
            } else if (int(displayValue) < 0) {
              String replacedValueToCompute2 = valueToCompute2.replace("-", "");
              valueToCompute2 = replacedValueToCompute2;
              displayValue = valueToCompute2;
            }
          }
        } else if (ispButtons.spButtonValue == "π") {
          if (firstNum) {
            valueToCompute = "3.14159265358979323846";
            displayValue = "3.14159265358979323846";
          } else {
            valueToCompute2 = "3.14159265358979323846";
            displayValue = "3.14159265358979323846";
          }
        } else if (ispButtons.spButtonValue == "More") {
          more = true;
        }
      }
    }
  } 
  // special buttons ^^^

  // more page ----------------------------------------------------

  else if (more) {

    //numbers   
    for (int i = 0; i < calcButtons.length; i++) {
      Button inumButtons = calcButtons[i];
      inumButtons.click();
      if (inumButtons.overBox) {
        if (firstNum) {
          //println(i + "" + inumButtons.numButtonValue);
          valueToCompute += int(inumButtons.numButtonValue);
          displayValue = valueToCompute;
        } else {
          valueToCompute2 += int(inumButtons.numButtonValue);
          displayValue = valueToCompute2;
        }
      }
    }
    // more number buttons ^^^

    // more special buttons
    for (int i = 0; i < moreSPButtons.length; i++) {
      Button imoreSPButtons = moreSPButtons[i];
      imoreSPButtons.click();
      if (imoreSPButtons.overBox) {
        if (imoreSPButtons.spButtonValue == "C") {
          displayValue = "0";
          displayValue2 = "";
          firstNum = true;
          valueToCompute = "";
          valueToCompute2 = "";
        } else if (imoreSPButtons.spButtonValue == ".") {
          if (firstNum) {
            if (displayValue.contains(".")) {
              //does nothinga
            } else {
              valueToCompute += ".";
              displayValue = valueToCompute;
            }
          } else {
            if (displayValue.contains(".")) {
              // does nothing
            } else {
              valueToCompute2 += ".";
              displayValue = valueToCompute2;
            }
          }
        } else if (imoreSPButtons.spButtonValue == "←") {
          more = false;
        }
      }
    }
    // more special buttons ^^^

    // more operator values
    for (int i = 0; i < moreOPButtons.length; i++) {
      Button imoreOPButtons = moreOPButtons[i];
      imoreOPButtons.click();
      if (imoreOPButtons.overBox) {
        if (imoreOPButtons.opButtonValue == "+") {
          if (result != 0) {
            opValue = '+';
            valueToCompute2 = "";
            firstNum = false;
            displayValue2 = "+";
          } else {
            opValue = '+';
            firstNum = false;
            displayValue2 = "+";
          }
        } else if (imoreOPButtons.opButtonValue == "=") {
          // perform calculation
          performCalculation();
          displayValue2 = "";
          firstNum = true;
        } else if (imoreOPButtons.opButtonValue == "-") {
          if (result != 0) {
            opValue = '-';
            valueToCompute2 = "";
            firstNum = false;
            displayValue2 = "-";
          } else {
            opValue = '-';
            firstNum = false;
            displayValue2 = "-";
          }
        } else if (imoreOPButtons.opButtonValue == "X") {
          if (result != 0) {
            opValue = 'X';
            valueToCompute2 = "";
            firstNum = false;
            displayValue2 = "X";
          } else {
            opValue = 'X';
            firstNum = false;
            displayValue2 = "X";
          }
        } else if (imoreOPButtons.opButtonValue == "÷") {
          if (result != 0) {
            opValue = '÷';
          } else 
            opValue = '÷';
          firstNum = false;
          displayValue2 = "÷";
        } else if (imoreOPButtons.opButtonValue == "Cos") {
          if (firstNum) {
            firstNum = false;
            opValue = 'C';
            displayValue2 = "cos()";
          } else {
            opValue = 'C';
            displayValue2 = "cos()";
          }
        } else if (imoreOPButtons.opButtonValue == "Sin") {
          if (firstNum) {
            opValue = 'S';
            displayValue2 = "sin()";
          } else {
            opValue = 'S';
            displayValue2 = "sin()";
          }
        } else if (imoreOPButtons.opButtonValue == "Tan") {
          if (firstNum) {
            opValue = 'T';
            displayValue2 = "tan()";
          } else {
            opValue = 'T';
            displayValue2 = "tan()";
          }
        } //else if () {

        // }
      }
    }
  }
}

void performCalculation() {
  // set value of the strings to integers
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);
  /*if (valueToCompute2.isEmpty()) {
   valueToComputeI2 = 0;
   } 
   if (valueToCompute.isEmpty()) {
   valueToComputeI = 0;
   } */
  // perform calculation based on the appropriate operator
  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'X') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '÷') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'C') {
    float cosValue = cos(float(displayValue));
    result = cosValue;
    displayValue = str(result);
  } else if (opValue == 'S') {
    float sinValue = sin(float(displayValue));
    result = sinValue;
    displayValue = str(result);
  } else if (opValue == 'T') {
    float tanValue = tan(float(displayValue));
    result = tanValue;
    displayValue = str(result);
  }

  if (firstNum) {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  }
}

void updateDisplay() {
  fill(255);
  rect(30, 20, 300, 50);
  fill(0);
  textSize(20);
  text(displayValue, 30, 40);
  text(displayValue2, 30, 60);
}

void keyPressed() {
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key == '2') {
    handleKeyPressNum("2");
  } else if (key == '3') {
    handleKeyPressNum("3");
  } else if (key == '4') {
    handleKeyPressNum("4");
  } else if (key == '5') {
    handleKeyPressNum("5");
  } else if (key == '6') {
    handleKeyPressNum("6");
  } else if (key == '7') {
    handleKeyPressNum("7");
  } else if (key == '8') {
    handleKeyPressNum("8");
  } else if (key == '9') {
    handleKeyPressNum("9");
  } else if (key == '0') {
    handleKeyPressNum("0");
  } else if (key == '=' || keyCode == ENTER || keyCode == RETURN) {
    handleKeyPressOp("=");
  } else if (key == '+') {
    handleKeyPressOp("+");
  } else if (key == '-') {
    handleKeyPressOp("-");
  } else if (key == '*' || key == 'X' || key == 'x') {
    handleKeyPressOp("X");
  } else if (key == '/') {
    handleKeyPressOp("÷");
  } else if (key == 'C' || key == 'c') {
    handleKeyPressOp("C");
  } else if (keyCode == BACKSPACE) {
    handleKeyPressOp("backSpace");
  }
}

void handleKeyPressNum(String keyPress) {
  if (firstNum) {
    valueToCompute += keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue = valueToCompute2;
  }
}

void handleKeyPressOp(String keyPress) {
  if (keyPress == "C") {
    displayValue = "0";
    displayValue2 = "";
    opValue = 'C';
    firstNum = true;
    valueToCompute = "";
    valueToCompute2 = "";
    valueToComputeI2 = 0;
  } else if (keyPress == "÷") {
    firstNum = false;
    opValue = '÷';
    displayValue2 = "÷";
  } else if (keyPress == "X") {
    firstNum = false;
    opValue = 'X';
    displayValue2 = "X";
  } else if (keyPress == "=") {
    performCalculation();
    displayValue2 = "";
    firstNum = true;
  } else if (keyPress == "+") {
    firstNum = false;
    opValue = '+';
    displayValue2 = "+";
  } else if (keyPress == "-") {
    firstNum = false;
    opValue = '-';
    displayValue2 = "-";
  } else if (keyPress == "backSpace") {
    if (firstNum) {
      if (valueToCompute.length() == 0) {
      } else {
        valueToCompute =  valueToCompute.substring( 0, valueToCompute.length()-1 );
      }
      displayValue = valueToCompute;
    } else {
      if (valueToCompute2.length() == 0) {
      } else {
        valueToCompute2 =  valueToCompute2.substring( 0, valueToCompute2.length()-1 );
      }
      displayValue = valueToCompute2;
    }
  }
}


class Button {
  //button location and size
  boolean isNumber;
  boolean isSpecial;
  boolean isOperator;
  boolean isMore;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  String trigButtonValue;
  String moreButtonValue;
  float x;
  float y;
  float w;
  float h;
  // is button on or off
  boolean overBox = false;
  boolean big = false;
  boolean first = false;

  // constructor initializes all variables 
  Button(float tempX, float tempY) {
    x = tempX;
    y = tempY;
  }

  Button asNumber(float tempNumButtonValue, float tempW, float tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    w = tempW;
    h = tempH;
    return this;
  }

  Button asOperator(String tempOpButtonValue, float tempW, float tempH, boolean tempBig, boolean tempFirst) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    w = tempW;
    h = tempH;
    big = tempBig; 
    first = tempFirst;
    return this;
  }

  Button asSpecial(String tempSpecButtonValue, float tempW, float tempH, boolean tempBig) {
    isSpecial = true;
    spButtonValue = tempSpecButtonValue;
    w = tempW;
    h = tempH;
    big = tempBig;
    return this;
  }
  
  Button moreSpecial(String tempMoreButtonValue, float tempW, float tempH) {
    isMore = true;
    moreButtonValue = tempMoreButtonValue;
    w = tempW;
    h = tempH;
    return this;
  }
  
  //Button moreButton(String tempMoreButtonValue, float tempW, float TempH) {
    
  //}

  // member variables
  void display() {
    stroke(-10);
    if (isNumber) {
      fill(255, 0, 0);
      rect(x, y, w, h, 12, 12, 12, 12);
      fill(255);
      textSize(25);
      text(int(numButtonValue), x+18, y+30);
    } else if (isSpecial) {
      fill(255, 0, 0);
      rect(x, y, w, h, 12);
      fill(255);
      if (big){
        textSize(25);
        text(spButtonValue, x+10, y+25);
      } else {
        textSize(15);
        text(spButtonValue, x+6, y+20);
      }
    } else if (isOperator) {
      fill(255, 0, 0);
      rect(x, y, w, h, 12);
      fill(255);
      if (big && first) {
        textSize(40);
        text(opButtonValue, x + 40, y + 30);
      } else if (big) {
        textSize(40);
        text(opButtonValue, x + 10, y + 30);
      }else if (!big){
        textSize(20);
        text(opButtonValue, x + 5, y + 25);
        
      }
    } else if (isMore) {
      fill(255, 0, 0);
      rect(x, y, w, h, 12);
      fill(255);
      textSize(20);
      text(moreButtonValue, x + 5, y + 25);
    }
  }


  void click() {
    overBox = mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h;
  }
} 



