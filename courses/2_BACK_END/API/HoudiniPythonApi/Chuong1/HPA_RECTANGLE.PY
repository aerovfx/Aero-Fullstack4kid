import hou

# Nhập chiều dài và chiều rộng từ người dùng
a = 5
b = 4

# Tạo 4 điểm A, B, C, D
A = hou.Vector3(0, 0, 0)
B = hou.Vector3(a, 0, 0)
C = hou.Vector3(a, b, 0)
D = hou.Vector3(0, b, 0)

# Tạo mạng mới
geo = hou.node("/obj").createNode("geo")
geo.setName("Rectangle")

# Tạo nút "Add" để tạo điểm
add_node = geo.createNode("add")

# Tạo điểm A, B, C, D
add_node.setParms({"points": [A, B, C, D]})

# Tạo nút "PolyExtrude" để tạo hình chữ nhật từ các điểm
polyextrude_node = geo.createNode("polyextrude")
polyextrude_node.setInput(0, add_node)

# Tạo nút "Measure" để tính diện tích hình chữ nhật
measure_node = geo.createNode("measure")
measure_node.setInput(0, polyextrude_node)
measure_node.parm("areatype").set(1)  # Chỉ tính diện tích mặt phẳng

# Lấy giá trị diện tích
area = measure_node.parm("area").eval()

# Hiển thị kết quả
text = "Diện tích hình chữ nhật: {}".format(area)
hou.ui.displayMessage(text)

# Chuyển sang tab "Geometry Viewer" để xem kết quả
hou.ui.curDesktop().paneTabOfType(hou.paneTabType.SceneViewer).setCurrentState(hou.paneState.GeometryViewer)
