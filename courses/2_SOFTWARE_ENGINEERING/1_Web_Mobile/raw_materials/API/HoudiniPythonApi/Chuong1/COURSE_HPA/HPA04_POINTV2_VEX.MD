float radius = 10.0;
int totalpoints = 45;
float pi2 = 3.1415926535897932384*2;
float percent = pi2/(float)totalpoints;
float index = 0.0;
vector origin = set(0,0,0);

float x,y;
vector pos;

while (index < pi2){
    x = origin.x + cos(index) * radius;
    y = origin.y + sin(index) * radius;
    
    // Gán vị trí điểm trên mặt phẳng 0xy, M(x, y)
    pos = set(x, y, 0);
    
    // tạo điểm
    addpoint(0, pos);
    
    index += percent;
    
}
