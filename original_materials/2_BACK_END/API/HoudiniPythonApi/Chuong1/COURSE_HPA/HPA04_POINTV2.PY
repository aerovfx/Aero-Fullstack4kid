import math

radius = 10.0
totalpoints = 45
pi2 = 3.1415926535897932384 * 2
percent = pi2 / float(totalpoints)
index = 0.0
origin = (0, 0, 0)

geo = hou.pwd().geometry()  # Truy cập vào đối tượng geometry của node hiện tại

while index < pi2:
    x = origin[0] + math.cos(index) * radius
    y = origin[1] + math.sin(index) * radius
    
    # Gán vị trí điểm trên mặt phẳng 0xy, M(x, y)
    pos = (x, y, 0)
    
    # Tạo điểm
    pt = geo.createPoint()
    pt.setPosition(pos)
    
    index += percent
