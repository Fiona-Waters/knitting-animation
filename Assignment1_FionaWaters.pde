import javax.swing.*;

/*
 Name : Fiona Waters
 Student Number: 20095357
 Brief description of the animation achieved:
 Simulation of knitting. This inludes 2 moving needles and 2 rows of stitches to begin with. There is a ball of yarn in the bottom 
 left corner attached to the knitting by a strand. As you click the mouse the knitting will grow i.e. a new row will appear. At the 
 same time the yarn ball will decrease in size. Text will also appear asking you to knit 'just one more row' - if you entered your name
 in the dialog box at the beginning this will be added here. This text changes when the knitting is completed (after 20 rows/clicks of the mouse).
 When 20 rows have been added the yarn ball will be depleted and the needles will stop. 
 When the mouse is moved pg1 of a knitting pattern will appear in the top right corner of the screen, 
 when the mouse is dragged pg2 of the pattern will appear.
 */

int lx1 = 50;  // 3 x-coordinates of left needle (triangle) 
int lx2 = 800;
int lx3 = 50;
int rx1 = 1230; // 3 x-coordinates of right needle (triangle)
int rx2 = 500;
int rx3 = 1230;
int leftEdge= 1; //left edge of screen - parameter for needle movement
int leftStepIn = 50; // step in from left edge parameter for end of right direction needle movement
int rightEdge = 1279; // right edge of screen - parameter for needle movement
int rightStepIn = 1230; // step in from right edge parameter for end of left direction needle movement
int numRows = 0; //starting number of rows
int r = 255; //red
int g = 102; //green
int b = 102; //blue
int reducingCircle = 200; //diameter of circle/yarn ball
boolean movingOut = true; //for needle movement
boolean needlesMoving = true; //to stop needle movement
String enteredName = JOptionPane.showInputDialog("Please enter your name:"); //dialog box pops up and asks user to enter their name
String pattern = "Part 1 - Click your mouse to knit! Part 2 - Keep on clicking \n'til you run out of yarn!"; //pattern instructions

/* setup function setting size of output window and shape outline thickness
 */
void setup ()
{
  size(1280, 720); // size of output window
  strokeWeight(2); //shape outline thickness
}
/* draw function executes code repeatedly */
void draw()
{ 
  int numStitches = 50; //number of stitches drawn across
  fill(179, 179, 179); //grey needles
  frameRate(20); //slowing down draw so that needles move more slowly
  background(110); //output window background dark grey
  stroke(0); //black outline
  triangle(lx1, 300, lx2, 200, lx3, 275); //drawing left knitting needle
  triangle(rx1, 300, rx2, 200, rx3, 275); //drawing right knitting needle

  if (needlesMoving == true) //tells needles to move/stop
  {
    if (movingOut == true) //moving needles in opposite direction to simulate knitting by increasing or decreasing x-coordinates of triangles
    {
      lx1 -=1;   
      lx2 -=1;
      lx3 -=1;
      rx1 +=1;
      rx2 +=1;
      rx3 +=1;
    } else 
    {
      lx1 +=1;
      lx2 +=1;
      lx3 +=1;
      rx1 -=1;
      rx2 -=1;
      rx3 -=1;
    }
  }
  if (lx1 == leftStepIn && rx1 == rightStepIn) 
  {
    movingOut = true;
  } else if (lx1 == leftEdge && rx1 == rightEdge) 
  {
    movingOut = false;
  }



  for (int i=0; i<numStitches; i+=1) //creates row of 50 stitches across x axis
  {
    int stitchDistance = 10*i; //10 pixels between each ellipse centre
    drawStitch(375+stitchDistance, 245);//calling stitch drawing method

    int partRow = 21; //creating smaller row at the top to fit with angle of needles
    if (i<partRow)
    {
      drawStitch(520+stitchDistance, 225);
    }
    int j = 0;        //drawing stitches on y axis
    while (j<numRows)
    {
      int stitchDistanceDown = 20*j;
      drawStitch(375+stitchDistance, 265+stitchDistanceDown);
      j++;
    }
  }

  /* adding text to the left side of screen which changes once 20 rows have 
   been added i.e. mouse has been clicked 20 times. */
  fill(0); //text colour black
  textSize(30); // text size 30 pixels

  if (numRows<20)
  {        
    text("Click the mouse to knit a row.", 0, 100);
  } else 
  {
    text("Knitting Complete!", 0, 100);
  }
  //calling drawYarnBall method to draw yarn ball on bottom left of screen
  drawYarnBall(150, 600, reducingCircle);
}

/*method used to draw stitches, no return, using 2 parameters */
void drawStitch(int x, int y) 
{
  noFill(); //nothing inside stitch
  stroke(r, g, b); //stitch outline colour
  ellipse(x, y, 15, 20); //draws stitch
} 
/* method used to draw yarn ball, no return, using 3 parameters */
void drawYarnBall(int circleX, int circleY, int circleW) 
{
  stroke(r, g, b); //outline colour
  fill(r, g, b); //yarn ball colour
  circle(circleX, circleY, circleW); //draw circle/yarn ball
  line(150, 600, 385, 245); //draw strand of yarn to connect ball to knitting
}
/* method executing code when mouse is clicked */
void mouseClicked() 
{
  if (mouseButton == RIGHT) //when right mouse button is clicked save drawing to .PNG file
  {
    save("knitting.PNG");
  }

  boolean pleaseKnitMore = true; //variable indicating that more rows of knitting can be added

  if (numRows <20) //maximum number of rows
  { 
    numRows = numRows + 1; //add a row every time the mouse is clicked

    //changing colour and reducing yarn ball size every time a row is added/the mouse is clicked   
    if (pleaseKnitMore == true)
    {
      r +=10;
      g +=10;
      b +=10;
      reducingCircle -=10;
    } 

    if (numRows <20) //When needles should move and when they should stop
    {
      pleaseKnitMore = true;
      needlesMoving = true;
    } else if (numRows >=20)
    {
      pleaseKnitMore = false;
      needlesMoving = false;
    }
  }
}
/* method executing code when mouse is released */
void mouseReleased() 
{
  String a = oneMoreRowText(enteredName); //calling oneMoreRowText method

  fill(0); //text colour black
  textSize(30); // text size 20 pixels
  text(a, 10, 150); //write a at these coordinates
}
/* method executing code when mouse is dragged - view page 2 virtual knitting pattern */
void mouseDragged() 
{
  stroke(0); //black outline
  fill(255); //white fill
  rect(1000, 25, 250, 200); //draw a rectangle/page
  fill(0); // black text
  textSize(18); 
  text("Knitting Pattern", 1005, 45); //write this text at these coordinates
  textSize(14);
  text(pattern.substring(35, 87), 1005, 95); //write this part of the String pattern at these coordinates
  text("Pg 2/2", 1010, 200); //write this text at these coordinates
}
/* method executing code when mouse is moved - view page 1 of virtual knitting pattern */
void mouseMoved() 
{
  stroke(0); //black outline
  fill(255); //white fill
  rect(1000, 25, 250, 200); //draw a rectangle/page
  fill(0); //fill black text
  textSize(18); 
  text("Knitting Pattern", 1005, 45); //write this text at these coordinates
  textSize(14);
  text(pattern.substring(0, 35), 1005, 95); //write this part of the String pattern at these coordinates
  text("Drag the mouse for Part 2.", 1005, 125); //write this text at these coordinates
  text("Pg 1/2", 1010, 200); //write this text at these coordinates
}
/*method to write text to the output screen saying 'Just one more row' + the name that is entered in the dialog box at the beginning.
 This also changes the text to Well done and the name in uppercase once 20 rows have been added by clicking the mouse. 
 It is common for knitters to want to do 'just one more row' but this can go on repeatedly! */
String oneMoreRowText(String answer) 
{
  if (numRows<20)
  {
    return "Just one more row, " + answer +"!";
  } 
  return "Well done " + answer.toUpperCase() +"!";
}
