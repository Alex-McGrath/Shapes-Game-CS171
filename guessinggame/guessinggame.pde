boolean win = false; // setting up the win boolean - this will be changed to true if the user wins
int clicks = 0; // keeps count of the amount of clicks the user has done
boolean losemessage = false; // setting up the lose message so if the user loses, this will change to true and print the lose message 

//randomising the colours

//random colour for the first shape (circle)
float r = random(255), g = random(255), b = random(255);
//random colour for the second shape (square)
float r2 = random(255),g2 = random(255),b2 = random(255);
//random colour for the third shape (triangle)
float r3 = random(255),g3 = random(255),b3 = random(255);
//random colour for the fourth shape (rectangle)
float r4 = random(255),g4 = random(255),b4 = random(255);

//setting the initial booleans for the the shapes, if swapped they will change colour
boolean colour = false;
boolean colour2 = false;
boolean colour3 = false;
boolean colour4 = false;

//array for the randomly generated shape prompt
String[] shapes = {"circle","triangle","square","rectangle"," "};
int index = int(random(4));

void setup() { 
  // initialize the screen 
  size(210, 220); 
  smooth(); 
} 
 
void draw() { 
   background(220); 
   
  // Setting up the if statements depending on whether the user wins or loses
  if(win == true){
         fill(0);
         text("You win!",105,116);
         textAlign(CENTER);
         shapes[index] = " ";
         if(keyPressed){ // if statement to close the game when SPACEBAR is pressed
           if (key == ' '){
             exit();
           }
         }
  }
    if(losemessage == true){
         fill(0);
         text("You lose! Press SPACE to close the game" ,105,116);
         textSize(10);
         textAlign(CENTER);
         win = false;
         shapes[index] = " ";
         if(keyPressed){ // if statement to close the game when SPACEBAR is pressed
           if (key == ' '){
             exit();
           }
         }
  }
 
  // Drawing the circle 
  if (colour == true) { 
    
    fill(0); 
    colour = false; 
  } else { 
    fill(r,g,b); 
  } 
  ellipse(50, 55, 100, 100); 

  // Drawing the square 
  //--------------------------------------
  if (colour2 == true) { 
    fill(0); 
    colour2 = false; 
  } else { 
    fill(r2,g2,b2); 
  } 
  rect(110, 10, 90, 90); 
  //--------------------------------------
  
  // Drawing the triangle
  if (colour3 == true) { 
    fill(0); 
    colour3 = false; 
  } else { 
    fill(r3,g3,b3); 
  } 
  triangle(50,120,0,212,100,212); 
  //--------------------------------------
  
  // Drawing the rectangle
  if (colour4 == true) { 
    fill(0); 
    colour4 = false; 
  } else { 
    fill(r4,g4,b4); 
  } 
  rect(110, 140, 90, 45); 
  //--------------------------------------
  
  
  //Setting up the colour of the prompt to match the colour of the shape and to give a random shape from the array
  if(shapes[index].equals("circle")){
    fill(r,g,b);
    text("Click the "+shapes[index],105,116);
    textAlign(CENTER);
  }
  else if(shapes[index].equals("square")){
    fill(r2,g2,b2);
    text("Click the "+shapes[index],105,116);
    textAlign(CENTER);
  }
   else if(shapes[index].equals("triangle")){
    fill(r3,g3,b3);
    text("Click the "+shapes[index],105,116);
    textAlign(CENTER);
  }
   else if(shapes[index].equals("rectangle")){
    fill(r4,g4,b4);
    text("Click the "+shapes[index],105,116);
    textAlign(CENTER);
  }
  else if(shapes[index].equals(" ")){ // this clears the original text off the screen to help with a bug i was having that caused the original prompt to overlap my WIN or LOSE prompt
    text(" "+shapes[index],105,116);
  }
} 
 
void mousePressed() { 
  if(mouseX< width/2&&mouseY<height/2){       // if the user clicks the circle
       colour = true; 
       r = 255; g = 255; b = 255;
       if(shapes[index].equals("circle")){
         win = true;
       }
  } 
  else if(mouseX>width/2&&mouseY<height/2){  // if the user clicks the square
       colour2 = true;
       r2 = 255; g2 = 255; b2 = 255;
       if(shapes[index].equals("square")){
         win = true;
       }
  }
  else if(mouseX<width/2&&mouseY>height/2){ //if the user clicks the triangle
       colour3 = true;
       r3 = 255; g3 = 255; b3 = 255;
       if(shapes[index].equals("triangle")){
         win = true;
       }
      
  }
  else{
       colour4 = true;
       r4 = 255; g4 = 255; b4 = 255;
       if(shapes[index].equals("rectangle")){ // if the user clicks the rectangle
         win = true;
       }
  }
  clicks++; // adds to the clicks int everytime a click is registered
  if(clicks > 1 || win == false){
    losemessage = true; //swaps the lose message boolean to true meaning the lose message will be printed to the screen
  }
}
