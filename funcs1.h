#ifndef FUNCS1_H
#define FUNCS1_H

// header file for funcs1


/*
 * Params[in]:
 * pointer to mesh m
 */
extern "C" {
extern int initABC( int downward_counts[4][4], int numberEntities[4]);
extern void resetVertIt();
extern void resetEdgeIt();
extern void resetFaceIt();
extern void incrementVertIt();
extern void incrementVertItn(int n);

extern void incrementEdgeIt();
extern void incrementEdgeItn(int n);

extern void incrementFaceIt();
extern void incrementFaceItn(int n);

extern void incrementElIt();
extern void incrementElItn(int n);

extern void resetElIt();
extern void setGlobalVertNumber(int val);
extern int getGlobalVertNumber();
extern int getVertNumber();
extern int getEdgeNumber();
extern int getFaceNumber();
extern int getElNumber();
extern apf::MeshEntity* getVert();
extern apf::MeshEntity* getEdge();
extern apf::MeshEntity* getFace();
extern apf::MeshEntity* getEl();

extern int getVertNumber2(apf::MeshEntity* e);
extern int getEdgeNumber2(apf::MeshEntity* e);
extern int getFaceNumber2(apf::MeshEntity* e);
extern int getElNumber2(apf::MeshEntity* e);



extern void checkVars();
extern void checkNums();
extern void getVertCoords(double coords[][3], int sx, int sy);
extern int getEdgeCoords(double coords[2][3], int sx, int sy);
extern int getFaceCoords(double coords[][3], int sx, int sy);
extern int getElCoords(double coords[][3], int sx, int sy);


}

#endif
