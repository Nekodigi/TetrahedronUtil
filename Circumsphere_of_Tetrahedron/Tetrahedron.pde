class Tetrahedron extends Polyhedron{
  PVector circumC;
  float circumR;
  Tetrahedron(float r){
    vertices = new PVector[4];
    float std = 500;
    vertices[0] = new PVector(r*sqrt(6)/3, r/3, -r*sqrt(2)/3).add(random(-std, std), random(-std, std));
    vertices[1] = new PVector(-r*sqrt(6)/3, r/3, -r*sqrt(2)/3).add(random(-std, std), random(-std, std));
    vertices[2] = new PVector(0, r/3, r*2*sqrt(2)/3).add(random(-std, std), random(-200, 200));
    vertices[3] = new PVector(0, -r, 0).add(random(-std, std), random(-std, std));
  }
  
  void show(){
    showVertices();
    Ipolygon(0, 1, 2);
    Ipolygon(0, 1, 3);
    Ipolygon(1, 2, 3);
    Ipolygon(2, 0, 3);
  }
  
  PVector calcCircum(){
    PVector v0 = vertices[0];
    PVector v1 = vertices[1];
    PVector v2 = vertices[2];
    PVector v3 = vertices[3];
    PVector u1 = PVector.sub(v1, v0);
    PVector u2 = PVector.sub(v2, v0);
    PVector u3 = PVector.sub(v3, v0);
    float sqrl01 = sqrDist(v0, v1);
    float sqrl02 = sqrDist(v0, v2);
    float sqrl03 = sqrDist(v0, v3);
    PVector u23c = new PVector();
    PVector u31c = new PVector();
    PVector u12c = new PVector();
    PVector.cross(u2, u3, u23c);
    PVector.cross(u3, u1, u31c);
    PVector.cross(u1, u2, u12c);
    PVector t1 = PVector.mult(u23c, sqrl01).add(PVector.mult(u31c, sqrl02)).add(PVector.mult(u12c, sqrl03));
    float t2 = PVector.dot(PVector.mult(u1, 2), u23c);
    circumC = PVector.add(v0, PVector.div(t1, t2));
    circumR = PVector.dist(circumC, v0);
    return circumC;
  }
}