node = hou.pwd()  # Gán node hiện tại vào biến 'node'
geo = node.geometry()  # Gán geometry của node vào biến 'geo'

# Thêm mã lệnh để sửa đổi nội dung của geo.
# Sử dụng menu thả xuống để chọn các ví dụ.

R = hou.parm("r").eval()
G = hou.parm("g").eval()
B = hou.parm("b").eval()

color = (R, G, B)  # Khai báo màu từ giá trị của R, G, B
color_attribs = geo.addAttrib(hou.attribType.Point, "Cd", (0.0, 0.0, 0.0))  # Thêm thuộc tính "Cd" (Color) cho từng điểm trong geometry và gán màu đen

for point in geo.points():  # Lặp qua từng điểm trong geometry
    if point.number() % 2 == 0:  # Kiểm tra điểm có số thứ tự chẵn hay không
        point.setAttribValue("Cd", color)  # Nếu điểm có số thứ tự chẵn, gán giá trị màu cho thuộc tính "Cd" của điểm đó
