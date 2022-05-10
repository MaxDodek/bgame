void game () {
  game.play();//fixWhy not wok?
  background(darkblue);
  timer--;

  //Pause Mode
  tactile(width/2, 35, 150, 50);
  fill(yellow);
  rect(width/2, 35, 150, 50);
  fill(darkblue);
  textSize(35);
  text("Pause", width/2, 45);
  fill(yellow);


  textSize(35);
  text("Lives: " +lives, width/3.5, 50);
  text("Score: " +score, width/1.3, 50);

  //paddles
  noStroke();
  fill(yellow);
  circle(px, py, pd);

  //move paddles
  if (lkey==true) px=px-5;
  if (rkey==true) px=px+5;

  if (px>=width-bd/2 +10) {
    px= width-bd/2 +10 ;
  }
  if (px<width/100) {
    px=width/100;
  }

  //ball
  strokeWeight(1);
  stroke(black);
  fill(yellow);
  circle(bx, by, bd);
  noStroke();
  strokeWeight(2);


  //move ball
  if (timer<0) {
    bx=bx+vx;
    by=by+vy;
  }

  //bounce aggainst top
  if (by<bd/2) {
    vy=vy*-1;
    bounce.rewind();
    bounce.play();
  }

  if (bx<bd/2||bx>width-bd/2) {
    vx=vx*-1;
    bounce.rewind();
    bounce.play();
  }

  //lives
  if (by>height-bd/2) {
    lives--;
    bx=width/2;
    by=height/2;
    timer=100;
    vx=0;
    vy=4;
  }

  if (lives==0) {
    mode=GAMEOVER;
    win = false;
  }


  //Avoiding ball glitches --- Ask if it will work
  if (bx<=0) {
    bx=10;
  }

  if (bx>=width) {
    bx=width-10;
  }
  //bounce against paddles
  if (dist(px, py, bx, by) <= bd/2 + pd/2) {
    vx=(bx - px)/5;
    vy =(by - py)/5;
    bounce.rewind();
    bounce.play();
  }

  //--------------------------------------------------------


  int i=0;
  while (i<n) {
    if (alive[i] ==true) {
      manageBrick(i);
    }
    i++;
  }
  if (score >= 75) {
    mode=GAMEOVER;
    win =true;
  }
}


void gameClicks () {
  if (isClicking(width/2, 35, 150, 50) == true) mode=PAUSE;  //to Pause game
}


void manageBrick(int i) {
  stroke(black);
  strokeWeight(2);
  if (y[i] == 100) fill (yellow); //how make one line of code for 3 lines, w/ same colour
  if (y[i] == 150) fill (lightblue);
  if (y[i] == 200) fill (yellow);
  if (y[i] == 250) fill (lightblue);
  if (y[i] == 300) fill (yellow);

  circle(x[i], y[i], brickd);

  if (dist(x[i], y[i], bx, by) <= bd/2 + brickd/2) { //brick colisions
    vx=(bx - x[i])/5;
    vy =(by - y[i])/5;
    alive[i] = false;
    vx=vx*1.2;
    vy=vy*1.2;
    score++;
    coin.rewind();
    coin.play();
    vx=vx+1;//why not working
    vy=vy+1;
  }
}
