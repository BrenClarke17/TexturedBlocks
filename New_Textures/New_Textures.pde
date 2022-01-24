float rotx, roty;
PImage grassBottom;
PImage grassTop;
PImage grassSide;
PImage diamondBlock;
void setup() {
  size(800, 800, P3D);
  grassBottom = loadImage("Grass_Block_Bottom.png");
  grassSide = loadImage("Grass_Block_Side.png");
  grassTop = loadImage("Grass_Block_Top.png");
diamondBlock = loadImage("diamond.png");
  textureMode(NORMAL);
}

void draw() {
  background(0);
  texturedCube(width/2, height/2, 0, grassTop, grassSide, grassBottom, 200);
  texturedCube(600, 100, 0, grassBottom, 200);
  texturedCube(100, 500, 0, diamondBlock, 200);
}

void texturedCube(float x, float y, float z, PImage top, PImage side, PImage bottom, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS);
  texture(top);

  //top  //x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  endShape();

  beginShape(QUADS);
  texture(bottom);
  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);

  endShape();


  beginShape(QUADS);
  texture(side);
  //front
  vertex(0, 1, 1, 0, 1);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 0, 1, 1, 0);
  vertex(0, 0, 1, 0, 0);
  //back

  vertex(0, 1, 0, 0, 1);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 0, 0, 1, 0);
  vertex(0, 0, 0, 0, 0);

  //left
  vertex(1, 1, 1, 0, 1);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 0, 0);

  //right
  vertex(0, 1, 1, 0, 1);
  vertex(0, 1, 0, 1, 1);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 0, 1, 0, 0);
  
  endShape();

  popMatrix();
}

void texturedCube(float x, float y, float z, PImage texture, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);
  rotateX(rotx);
  rotateY(roty);

  noStroke();

  beginShape(QUADS);
  texture(texture);

  //top  //x, y, z, tx, ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1);
  vertex(0, 0, 1, 0, 1);

  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1);
  vertex(0, 1, 1, 0, 1);


  //front
  vertex(0, 1, 1, 0, 1);
  vertex(1, 1, 1, 1, 1);
  vertex(1, 0, 1, 1, 0);
  vertex(0, 0, 1, 0, 0);
  //back

  vertex(0, 1, 0, 0, 1);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 0, 0, 1, 0);
  vertex(0, 0, 0, 0, 0);

  //left
  vertex(1, 1, 1, 0, 1);
  vertex(1, 1, 0, 1, 1);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 0, 0);

  //right
  vertex(0, 1, 1, 0, 1);
  vertex(0, 1, 0, 1, 1);
  vertex(0, 0, 0, 1, 0);
  vertex(0, 0, 1, 0, 0);

  endShape();

  popMatrix();
}
void mouseDragged() {
  rotx = rotx + (pmouseY - mouseY)*0.01;
  roty = roty + (pmouseX - mouseX)*-0.01;
}
