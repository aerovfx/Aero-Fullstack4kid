import hou

# Tạo đối tượng node kiểu Box lớn
box_large = hou.node("/obj").createNode("geo").createNode("box")
box_large.parmTuple("t").set((0, 0, 0))  # Thiết lập vị trí ban đầu
box_large.parmTuple("s").set((2, 2, 2))  # Thiết lập kích thước

# Tạo đối tượng node kiểu Sphere nhỏ
sphere_small = hou.node("/obj").createNode("geo").createNode("sphere")
sphere_small.parmTuple("t").set((0, 0, 0))  # Thiết lập vị trí ban đầu
sphere_small.parmTuple("s").set((0.5, 0.5, 0.5))  # Thiết lập kích thước

# Tạo đối tượng node kiểu Boolean
boolean = hou.node("/obj").createNode("geo").createNode("boolean")
boolean.parm("booltype").set(2)  # Thiết lập kiểu toán tử boolean là "Subtract"
boolean.setInput(0, box_large)  # Đặt hình hộp lớn làm đầu vào 0
boolean.setInput(1, sphere_small)  # Đặt hình cầu nhỏ làm đầu vào 1

# Tạo đối tượng node kiểu Merge
merge = hou.node("/obj").createNode("geo").createNode("merge")
merge.setInput(0, box_large)  # Đặt hình hộp lớn làm đầu vào 0
merge.setInput(1, boolean)  # Đặt kết quả toán tử boolean làm đầu vào 1
