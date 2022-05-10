void gameover() {
  if (win==true) {
    win();
  } else {
    loose();
  }

  fill(yellow);
  tactile(width/2, height/1.5, 200, 100);
  rect(width/2, height/1.5, 200, 100);
  fill(lightblue);
  textSize(35);
  text("End Game", width/2, height/1.5);
}




void gameoverClicks () {
  if (isClicking(width/2, height/1.5, 200, 100) == true) { //to intro
    mode=INTRO;
    //gameover.pause();
    vx= 4;
    vy= 3;
    lives=3;
    score =0;
    timer=100;

    //Initialize Brick //Do I need Too Restate this entire Code???
      brick();

    //initialize paddle:
    px = width/2;
    py=height;
    pd=100;

    //initialize ball
    bx=width/2;
    by=height/2;
  }
}

void loose() {
 background(green);
  strokeWeight(2);
  stroke(grey);
  fill(lightblue);
  textSize(100);
  text("You Lost", width/2, width/2);
}

void win() {
  background(black);
  fill(green);
  textSize(100);
  text("You Won", width/2, width/2);
}
