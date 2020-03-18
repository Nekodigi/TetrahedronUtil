void point(PVector p){
  point(p.x, p.y, p.z);
}

void point(PVector p, float r){
  strokeWeight(r);
  point(p.x, p.y, p.z);
}

void sphere(PVector p, float r){
  pushMatrix();
  translate(p);
  sphere(r);
  popMatrix();
}

void translate(PVector p){
  translate(p.x, p.y, p.z);
}

void text(String str, PVector p){
  text(str, p.x, p.y, p.z);
}

void vertex(PVector p){
  vertex(p.x, p.y, p.z);
}

void polygon(PVector ... ps){
  beginShape();
  for(PVector p : ps){
    vertex(p);
  }
  endShape(CLOSE);
}

float sqrDist(PVector a, PVector b){
  return PVector.dot(PVector.sub(a, b), PVector.sub(a, b));
}