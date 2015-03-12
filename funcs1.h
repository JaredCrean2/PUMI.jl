#ifndef FUNCS1_H
#define FUNCS1_H

// header file for funcs1


/*
 * Params[in]:
 * pointer to mesh m
 */
extern "C" {
// this function does not pass opaque pointers
extern int initABC(char* dmg_name, char* smb_name, int downward_counts[4][4], int numberEntities[4], apf::Mesh2* m_ptr_array[1], apf::FieldShape* mshape_ptr_array[1]);

int initABC2(char* dmg_name, char* smb_name, int downward_counts[3][3], int number_entities[3], apf::Mesh2* m_ptr_array[1], apf::FieldShape* mshape_ptr_array[1] );

// these functions do pass pointers
extern apf::Mesh2* getMeshPtr();
extern apf::FieldShape* getMeshShapePtr();
extern apf::FieldShape* getConstantShapePtr(int dimension);
extern apf::Numbering* getVertNumbering();
extern apf::Numbering* getEdgeNumbering();
extern apf::Numbering* getFaceNumbering();
extern apf::Numbering* getElNumbering();

// these functions do not pass pointers
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
extern void setGlobalVertNumber(int val); // do not use
extern int getGlobalVertNumber(); // do not use
extern int getVertNumber();
extern int getEdgeNumber();
extern int getFaceNumber();
extern int getElNumber();

// these functions pass pointers to/from julia
extern apf::MeshEntity* getVert();
extern apf::MeshEntity* getEdge();
extern apf::MeshEntity* getFace();
extern apf::MeshEntity* getEl();

extern int getVertNumber2(apf::MeshEntity* e);
extern int getEdgeNumber2(apf::MeshEntity* e);
extern int getFaceNumber2(apf::MeshEntity* e);
extern int getElNumber2(apf::MeshEntity* e);

extern int getMeshDimension(apf::Mesh2* m_local);
extern int getType(apf::Mesh2* m_local, apf::MeshEntity* e);
extern int getDownward(apf::Mesh2* m_local, apf::MeshEntity* e, int dimension, apf::MeshEntity* downwards[12]);

// these function do not pass pointers
extern void checkVars();
extern void checkNums();
extern void getVertCoords(double coords[][3], int sx, int sy);
extern int getEdgeCoords(double coords[2][3], int sx, int sy);
extern int getFaceCoords(double coords[][3], int sx, int sy);
extern int getElCoords(double coords[][3], int sx, int sy);

// these function pass pointers
//extern int countNodesOn(apf::FieldShape* field, int type);

// create a generally defined numbering from julia
extern  apf::Numbering* createNumberingJ(apf::Mesh2* m_local, char* name, apf::FieldShape* field, int components);
extern int numberJ(apf::Numbering* n, apf::MeshEntity* e, int node, int component, int number);
extern  int getNumberJ(apf::Numbering* n, apf::MeshEntity* e, int node, int component);

extern int countNodesOn(apf::FieldShape* mshape_ptr, int type);
extern void printNumberingName(apf::Numbering* n);

extern apf::MeshTag* createDoubleTag(apf::Mesh2 * m_local, char* name, int size);

void setDoubleTag(apf::Mesh2* m_local, apf::MeshEntity* e, apf::MeshTag* tag,  double data[]);

void getDoubleTag(apf::Mesh2* m_local, apf::MeshEntity* e, apf::MeshTag* tag,  double* data);

}

#endif
