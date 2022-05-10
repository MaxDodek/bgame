boolean isClicking (float x, float y, float w, float h) {
  if (mouseX > x - w/2 && mouseX< x + w/2 && mouseY> y - h/2 && mouseY<y+h/2) {
    return true;
  } else {
    return false;
  }
}


void tactile(float x, float y, float w, float h) {
  if (mouseX > x - w/2 && mouseX< x + w/2 && mouseY> y - h/2 && mouseY<y+h/2) {
    stroke (black);
    strokeWeight(1);
  } else {
    stroke(black);
    strokeWeight(3.5);
  }
}

void brick(){
   brickd =50;
  n= 75; // why is my first brick away from my entire patern????
  x = new int [n];
  y = new int [n];
  alive=new boolean [n];
  tempx = 50;
  tempy=100;

   i=0;

  while (i<n) {

    x[i]= tempx;
    y[i]=tempy;
    alive[i] = true;
    tempx=tempx+50;

    if (tempx==width) {
      tempx=50;
      tempy=tempy+50;
    }


    i=i+1;
  }
  
}
