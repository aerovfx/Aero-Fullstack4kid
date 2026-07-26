int pt1 = addpoint(0,set(0,0,0)); // Tạo một điểm mới tại vị trí (0, 0, 0)
int pt2 = addpoint(0,set(0,0,1)); // Tạo một điểm mới tại vị trí (0, 0, 1)
int pt3 = addpoint(0,set(1,0,1)); // Tạo một điểm mới tại vị trí (1, 0, 1)
int pt4 = addpoint(0,set(1,0,0)); // Tạo một điểm mới tại vị trí (1, 0, 0)
int prim1 = addprim(0,"poly");  // Tạo một đa giác mới

addvertex(0, prim1, pt1);  // Thêm điểm pt1 vào đa giác prim1
addvertex(0, prim1, pt2);  // Thêm điểm pt2 vào đa giác prim1
addvertex(0, prim1, pt3);  // Thêm điểm pt3 vào đa giác prim1
addvertex(0, prim1, pt4);  // Thêm điểm pt4 vào đa giác prim1
