import hou
node = hou.pwd()  # Gán node hiện tại đến biến 'node'
geo = node.geometry()  # Gán geometry của node vào biến 'geo'

# Thêm mã lệnh để sửa đổi nội dung của geo.
# Sử dụng menu thả xuống để chọn các ví dụ.

red = (1.0, 0.0, 0.0)  # Khai báo màu đỏ
green = (0.0, 1.0, 0.0)  # Khai báo màu xanh lá cây

color_attribs = geo.addAttrib(hou.attribType.Point, "Cd", red)  # Thêm thuộc tính "Cd" (Color) cho từng điểm trong geometry và gán màu đỏ

for point in geo.points():  # Lặp qua từng điểm trong geometry
    if point.number() % 2 == 0:  # Kiểm tra điểm có số thứ tự chẵn hay không
        point.setAttribValue("Cd", green)  # Nếu điểm có số thứ tự chẵn, gán giá trị màu xanh lá cây cho thuộc tính "Cd" của điểm đó

