class TimeSphere {

  boolean isVis;
  boolean startFading;
  float xposInit;
  float speed; //0.00x
  int alphaS = 254;
  float angle = 0;

  PImage texture1;
  boolean down;
  int frameCounter;

  int totalCycles;
  int finishedCycles;

  TimeSphere(float xInit, float sp, PImage textureImage) {
    xposInit = xInit;
    speed = sp;
    frameCounter = 0;
    finishedCycles = 0;

    texture1 = textureImage;
  }

  int drawSphere(int mSize, int numCycles) {
    if (numCycles != totalCycles) {
      totalCycles = numCycles;
      println(totalCycles);
      println(finishedCycles);
      finishedCycles = 0;
    }    

    moveVert();    
    if (alphaS <= 0) {
      return 1;
    }
    return 0;
  }

  void moveVert() {
    fill(255, 255, 255, alphaS);
    pushMatrix();
    float yCoord = (0.5 * height) + (sin(frameCounter * speed + xposInit * 360)*490);
    float xCoord = xposInit * width;

    if(yCoord == 30) {
      finishedCycles += 1;
    }

    if (yCoord < 30 && (finishedCycles >= totalCycles)) {
      startFading = true;
    }
    if (startFading && alphaS >= 0) {
      alphaS -= 1;
    }

    translate(xCoord, yCoord);
    rotate(angle);
    angle += 0.1;

    float rMod = yCoord/(width/2);
    float rad = 20 * rMod;

    if (startFading) {
      tint(255, alphaS);
    }
    image(texture1, -rad, -rad, rad*2, rad*2);
    noTint();
    sphere(rad);
    popMatrix();
    
    frameCounter+=1;
  }
}
//josh is a helper...
//rntz is a SUPER distractor...

