int limit = 20;

public void setup()
{
  size(800, 800, P3D);
}
public void draw()
{
  background(155);
  translate(width/2, height/2, -200); // move the origin to the center of the window
  rotateX(frameCount * 0.01); // rotate the scene around the x-axis
  rotateY(frameCount * 0.01); // rotate the scene around the y-axis
  sierpinski(-100, -100, 500);
}
public void keyPressed()//optional
{
  if(limit >= 5)
  {
    if (keyCode == LEFT)
    {
      limit -= 5;
    }
  }
  if (keyCode == RIGHT)
  {
    limit += 5;
  }
}

public void sierpinski(int x, int y, int len) 
{
  if (len <= limit)
  {
    beginShape(); // start drawing triangles
    
    vertex(x + 0.5 * len, y - len, 0); //top
    vertex(x, y, len /2); //front bottom left
    vertex(x + len, y, len / 2); //front bottom right
    
    vertex(x + 0.5 * len, y - len, 0); //top
    vertex(x , y, -len / 2); //back bottom left
    vertex(x + len, y, -len / 2); //back bottom right
    
    vertex(x + 0.5 * len, y - len, 0); //top
    vertex(x, y, len /2); //front bottom left    
    vertex(x , y, -len / 2); //back bottom left
    
    vertex(x + 0.5 * len, y - len, 0); //top
    vertex(x + len, y, len / 2); //front bottom right
    vertex(x + len, y, -len / 2); //back bottom right
    

    endShape(); // end drawing triangles
  }
  else 
  {
    sierpinski(x, y, len / 2);
    sierpinski(x + (int)(0.25 * len), y - (int)(0.5 * len), len / 2);
    sierpinski(x + (int)(0.5 * len), y, len / 2);
  }
}

//Write the sierpinski function:

//If len is less than or equal to 20 (or some variable)
//Draw a triangle with the left corner at (x,y) and a base and height equal to len.

//else
//recursively call the sierpinksi function to draw a triangle with the left corner at (x,y) 
//and a base and height equal to len/2.

//Again, call the sierpinksi function a second time to draw another triangle a distance of 
//len/2 to the right of the first triangle.

//Now, call the sierpinksi function a third time to draw a triangle a distance of 
//len/4 to the right and len/2 up from the first triangle. This triangle should "sit on top" of the first two.

//Once you have the sierpinksi function completed, call it once in draw() to start the process. 
//You can change the number and size of the triangles 
//by changing the base case limit in the if from 20 to some variable and adjusting the value of the variable. 
//Some ways to make the program interactive include using 
//mousePressed(), keyPressed(), mouseDragged() or mouseMoved() to change the base case limit.
