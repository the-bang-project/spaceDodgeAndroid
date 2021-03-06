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

  boolean moveLeft = false;
  boolean moveRight = false;

  void caller()
  {
    show();
    move();
    edgeDetect();
    dead();
    restrict();
    executeMovementCommands();
    mouseReleased();
  }

  void show()
  {
    imageMode(CENTER);
    image(ship, x, y, playerLength, playerLength);
    score += 1;
  }

  void move()
  {
    if (mousePressed == true)
    {
      if (mouseX > displayWidth/2 && mouseY > displayHeight/2 && moveLeft == false)
      {
        moveRight = true;
      }
      if (mouseX < displayWidth/2 && mouseY > displayHeight/2 && moveRight == false)
      {
        moveLeft = true;
      }
    }
  }

  void restrict()
  {
    if (rightEdge > displayWidth)
    {
      x = displayWidth - playerLength/2;
    }
    if (leftEdge < 0)
    {
      x = 0 + playerLength/2;
    }
  }

  void dead()
  {
    if (lives <= -1)
    {
      highScore = score;
      if (highScore > shownHighScore)
      {
        shownHighScore = score;
      }
      score = 0;
      lives = 10;
      menu.gameActive = false;
      menu.deadActive = true;
    }
  }

  void edgeDetect()
  {
    leftEdge = x - playerLength/2;
    rightEdge = x + playerLength/2;
    topEdge = y - playerLength/2;
    bottomEdge = y + playerLength/2;
  }

  void executeMovementCommands()
  {
    if (moveRight == true)
    {
      x += move;
    }
    if (moveLeft == true)
    {
      x -= move;
    }
  }

  void mouseReleased()
  {
    moveLeft = false;
    moveRight = false;
  }
}
