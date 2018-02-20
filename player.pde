// Copyright (C) 2018 Dylan Neve <dylanneve1@gmail.com>

class Player
{

  float x = displayWidth/2;
  float y = displayHeight*0.9;

  float leftEdge;
  float rightEdge;
  float topEdge;
  float bottomEdge;

  int lives = 10;

  int score = 0;
  int highScore = 0;
  
  float playerLength = displayWidth*0.1;

  float move = displayWidth*0.015;

  void caller()
  {
    show();
    move();
    edgeDetect();
    dead();
  }

  void show()
  {
    noStroke();
    fill(255);
    rectMode(CENTER);
    rect(x, y, playerLength, playerLength);
    score += 1;
  }

  void move()
  {
    if (mousePressed == true)
    {
      if (mouseX > displayWidth/2)
      {
        x += move;
      }
      if (mouseX < displayWidth/2)
      {
        x -= move;
      }
    }
  }

  void dead()
  {
    if (lives <= -1)
    {
      highScore = score;
      score = 0;
      menu.gameActive = false;
      menu.dead = true;
    }
  }

  void edgeDetect()
  {
    leftEdge = x - playerLength/2;
    rightEdge = x + playerLength/2;
    topEdge = y - playerLength/2;
    bottomEdge = y + playerLength/2;
  }
}