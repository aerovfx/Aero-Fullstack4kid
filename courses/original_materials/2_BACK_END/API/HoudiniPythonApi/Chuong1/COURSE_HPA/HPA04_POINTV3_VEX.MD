// Connect point with lines

float searchrad = chf("rad");
int numlines = chi("numlines");


int npts[] = nearpoints(0, @P, searchrad);

if(len(npts) > 1){
    for(int i=1; i<numlines; i++){
        int npt = npts[max(floor(rand(@P + i * 3.5 + ch("seed")) * len(npts)), 1)];
        int line = addprim(0, "polyline", @ptnum, npt);
    }
}

//
int pts[] = primpoints(0, @primnum);
vector pos1 = point(0, "P", pts[0]);
vector pos2 = point(0, "P", pts[1]);

vector dir = pos2 - pos1;
vector dirx = set(dir.x, 0, 0);
vector diry = set(0, dir.y, 0);
vector dirz = set(0, 0, dir.z);

vector dirs[] = array(dirx, diry, dirz);
float args[] = array();
for(int i=0; i<len(dirs); i++){
    append(args, rand(@primnum * 3.2 + i * 4.234 + chf("seed")));
}
int indices[] = argsort(args);

dirs = reorder(dirs, indices);

v@dir0 = dirs[0];
v@dir1 = dirs[1];

int npts[] = array(pts[0]);

vector npos1 = pos1 + dirs[0];
if(distance(npos1, pos1) > 0.001 && distance(npos1, pos2) > 0.001){
    int npt1 = addpoint(0, npos1);
    append(npts, npt1);
}

vector npos2 = pos1 + dirs[0] + dirs[1];
if(distance(npos2, pos1) > 0.001 && distance(npos2, pos2) > 0.001){
    int npt2 = addpoint(0, npos2);
    append(npts, npt2);
}

append(npts, pts[1]);


int polyline = addprim(0, "polyline", npts);

removeprim(0, @primnum, 1);
 
 
 //
int vts[] = primvertices(0, @primnum);
int pts[] = array();
for(int i=0; i<len(vts); i++){
    int vt = vts[i];
    int pt = vertexpoint(0, vt);
    append(pts, pt);
}


int npts[] = array();
append(npts, pts[0]);
float mdist = 0.0;
for(int i=0; i< len(pts)-2; i++){
    int pt0 = pts[i];
    int pt1 = pts[i+1];
    int pt2 = pts[i+2];
    
    vector pos0 = point(0, "P", pt0);
    vector pos1 = point(0, "P", pt1);
    vector pos2 = point(0, "P", pt2);
    
    float dist1 = distance(pos0, pos1);
    float dist2 = distance(pos1, pos2);
    float tmdist = min(dist1, dist2);
    
    float ratio = rand(@primnum * 3.234 + i * 6.234 + chf("seed"))* chf("ratio");
    tmdist *= ratio;
    
    tmdist = min(dist1 - mdist, tmdist);
    mdist = tmdist;
    
    
    vector npos1 = pos1 + normalize(pos0-pos1) * tmdist;
    vector npos2 = pos1 + normalize(pos2-pos1) * tmdist;
    
    int npt1 = addpoint(0, npos1);
    int npt2 = addpoint(0, npos2);
    
    
    append(npts, npt1);
    append(npts, npt2);
}

append(npts, pts[len(pts)-1]);

int polyline = addprim(0, "polyline", npts);
removeprim(0, @primnum, 1);


//
int vts[] = primvertices(0, @primnum);
int pts[] = array();
for(int i=0; i<len(vts); i++){
    int vt = vts[i];
    int pt = vertexpoint(0, vt);
    append(pts, pt);
}

float idist = 0.0;

for(int i=0; i<len(pts); i++){
    int pt0 = pts[max(i-1, 0)];
    int pt1 = pts[i];
    
    vector pos0 = point(0, "P", pt0);
    vector pos1 = point(0, "P", pt1);
    
    float dist = distance(pos0, pos1);
    idist += dist;
    
    setpointattrib(0, "t", pt1, set(@primnum * 1000, idist, 0));
    setpointattrib(0, "t", pt1, idist);
}