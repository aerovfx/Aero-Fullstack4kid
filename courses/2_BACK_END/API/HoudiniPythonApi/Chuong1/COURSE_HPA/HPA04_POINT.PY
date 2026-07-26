geo = hou.pwd().geometry()  # Lấy đối tượng "geometry" của node hiện tại

pt1 = geo.createPoint()  # Tạo một điểm mới trong "geometry"
pt1.setPosition((0, 0, 0))  # Đặt vị trí cho điểm pt1 tại (0, 0, 0)

pt2 = geo.createPoint()  # Tạo một điểm mới trong "geometry"
pt2.setPosition((0, 0, 1))  # Đặt vị trí cho điểm pt2 tại (0, 0, 1)

pt3 = geo.createPoint()  # Tạo một điểm mới trong "geometry"
pt3.setPosition((1, 0, 1))  # Đặt vị trí cho điểm pt3 tại (1, 0, 1)

pt4 = geo.createPoint()  # Tạo một điểm mới trong "geometry"
pt4.setPosition((1, 0, 0))  # Đặt vị trí cho điểm pt4 tại (1, 0, 0)

# Tính toán tâm của các điểm
center = (pt1.position() + pt2.position() + pt3.position() + pt4.position()) / 4

# Sắp xếp các điểm theo thứ tự ngược chiều kim đồng hồ xung quanh tâm
sorted_points = sorted([pt1, pt2, pt3, pt4], key=lambda pt: (pt.position() - center).angleTo(hou.Vector3(1, 0, 0)))

# Tạo một đa giác từ các điểm đã được sắp xếp
prim = geo.createPolygon()
for point in sorted_points:
    prim.addVertex(point)
