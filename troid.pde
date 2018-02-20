// Copyright (C) 2018 Dylan Neve <dylanneve1@gmail.com>

class Troid {

  float x;
  float y;
  float yspeed = displayHeight*0.012;

  float rightEdge;
  float leftEdge;
  float topEdge;
  float bottomEdge;

  boolean notYetTapped = true;
  boolean collided = false;

  float r = displayHeight*0.04;

  Troid() 
  {
    x  = random(width);
    y  = random(displayHeight*-1, displayHeight*-0.1);
  }

  void fall() 
  {
    y += yspeed;
    //yspeed += displayHeight*0.000006;
  }

  void show() 
  {
    strokeWeight(2);
    stroke(138, 43, 226);
    fill(0, 200, 0);
    rectMode(CENTER);
    rect(x, y, r, r);
  }

  void edgeDetect()
  {
    leftEdge = x - r/2;
    rightEdge = x + r/2;
    topEdge = y - r/2;
    bottomEdge = y + r/2;
  }

  void collide()
  {
    if (notYetTapped == true)
    {
      if (leftEdge <= player.rightEdge && rightEdge >= player.leftEdge && bottomEdge >= player.topEdge && bottomEdge <= player.bottomEdge)
      {
        //background(255);
        collided = true;
        notYetTapped = false;
      }
    }
  }


  void boop()
  {
    if (collided == true)
    {
      player.lives -= 1;
      background(255, 0, 0);
      collided = false;
    }
  }
}