/* Reflection

Name : Fiona Waters

Student Number: 20095357
 
Brief description of the animation achieved:
Simulation of knitting. This inludes 2 moving needles and 2 rows of stitches to begin with. There is a ball of yarn in the bottom 
left corner attached to the knitting by a strand. As you click the mouse the knitting will grow i.e. a new row will appear. At the 
same time the yarn ball will decrease in size. Text will also appear asking you to knit 'just one more row' - if you entered your name
in the dialog box at the beginning this will be added here. This changes when the knitting is completed (after 20 rows/clicks of the mouse).
When 20 rows have been added the yarn ball will be depleted and the needles will stop. 
When the mouse is moved pg1 of a knitting pattern will appear in the top right corner of the screen, when the mouse is dragged pg2 of the 
pattern will appear.

Part A - Mark (5 /5)
-----------------------------

Comments - 1/1
indented/formatted - 1/1 
naming - 1/1
includsion of Readme - 1/1 
includsion of Reflection - 1/1

Having reviewed and completed the above items I am recording 5/5.

Part B - Mark (2 /2)
-----------------------------

Sizing.

<just a mark needed here>


Part C - Mark (10 /10)
-----------------------------
line 44 - draw() 
line 38 - setup()

draw and setup are included and working. I am recording 10/10.

Part D - Mark (9 /10)
-----------------------------
Use of if statements:

lines 54-80 nested if statments with branches used for movement of knitting needles
line 56 shows a nested if
line 90 shows an if statement inside a loop used to create smaller row of knitting at the top
line 108 shows and if statement with a branch adding and changing text in output window
line 137 shows an if statement saving drawing to .PNG file when right mouse button is clicked
lines 144-166 shows nested if statements and branches used to add a row to the knitting and reduce 
              yarn ball size when mouse is clicked and also to show whether needles should be moving or stopped.
line 209 shows an if statement used when returning text to output window 

I have used multiple if statements, with branches, nested ifs and an if inside a loop. I am recording 
an excellent score for this 9/10

Part E - Mark (14 /20)
-----------------------------
Use of loops:

line 84 shows a nested loop with for and while loops used to draw stitches across x axis and down y axis 
to create knitted fabric.

I have used 2 types of loops which are nested. I am recording a very good score for this 69%  or 14/20

Part F - Mark (14 /20)
-----------------------------
Use of at least one bespoke method 

line 120 drawStitch() method - called on lines 87,92 and 98 - no return with 2 parameters
line 127 drawYarnBall() method - called on line 116 - no return with 3 parameters
line 207 oneMoreRowText() - called on line 171 - return value with 1 parameter

I have 3 bespoke methods with differing numbers of parameters, one with a return value and 2 without. 
I am recording an excellent score for this 70% or 14/20



Part G - Mark (10 /10)
-----------------------------
Use of Processing methods 

lines 47,105,130,173,181,183,194,196 fill()
line 48  frameRate()
line 49 background()
line 50,123,129,180,193 stroke()
lines 51+52 triangle()
line 106,174,184,186,197,199 textSize()
Lines 110,113,175,185,187,188,198,200,201,202 text()
line 122 noFill()
line 124 ellipse(
line 131 circle()
line 132 line()
line 139 save()
line 182,195 rect()

I have used 13 different processing methods at lines specified above. I am recording 10/10


Part H - Mark (8 /10)
-----------------------------
Use of Mouse methods 

line 135 mouseClicked()
line 169 mouseReleased()
line 178 mouseDragged()
line 191 mouseMoved()

I have used 4 mouse methods at lines specified above. I am recording 8/10.

Part I - Mark (6 /10)
-----------------------------
Use of String methods 

line 187 .substring()
line 200 .substring()
line 213 .toUpperCase()

 I have used 2 string methods on the lines specified above. 
 I am recording a good score 55% or 6/10

Part J - Mark (3 /3)
-----------------------------
Use of .PNG methods 

lines 137-140 shows how the .PNG file is saved

My program saves the display in a PNG file on a right mouse click. 3/3.

Total mark 81/100
*/
