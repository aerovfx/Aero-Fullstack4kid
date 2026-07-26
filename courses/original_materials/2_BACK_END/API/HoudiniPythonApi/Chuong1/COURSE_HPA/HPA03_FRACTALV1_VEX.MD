float radius = 10.0;
int totalpoints = 45;
float pi2 = 3.1415926535897932384 * 2;
float percent = pi2 / (float) totalpoints;
vector origin = set(0, 0, 0);

vector pos;
int pt;

for (float index = 0.0; index < pi2; index += percent) {
    float angle = index;
    pos = set(radius * cos(angle), radius * sin(angle), 0);
    pt = addpoint(0, pos);
}