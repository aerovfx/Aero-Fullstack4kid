# Sử dụng Python Shell
>>> dir()
['__annotations__', '__builtins__', '__doc__', '__loader__', '__name__', '__package__
', '__spec__', 'all_nodes', 'box', 'box1', 'box2', 'clear', 'distance', 'duration', '
frame', 'frame_count', 'frame_time', 'hou', 'houdiniInterpreter', 'myGeo', 'name', 'n
ode', 'nodethemes', 'obj', 'os', 'pdg', 'position', 'positionA', 'positionB', 'schema
utils', 'set_velocity', 'sleep', 'system', 'torus', 'velocity']

Giải thich ý nghĩa của các thành phần trong danh sách được hiển thị khi gọi dir() trong Python Shell của Houdini:

__annotations__: Chứa các chú thích (annotations) của biến, thường được sử dụng trong các trường hợp sử dụng kiểu dữ liệu (type hinting).
__builtins__: Mô-đun chứa các biến và hàm tích hợp sẵn trong Python.
__doc__: Chuỗi tài liệu mô tả cho mô-đun hiện tại hoặc đối tượng.
__loader__: Đối tượng dùng để tải mô-đun.
__name__: Tên của mô-đun hiện tại.
__package__: Tên gói (package) chứa mô-đun hiện tại.
__spec__: Đối tượng chứa thông tin về mô-đun hiện tại.
all_nodes: Một phương thức của đối tượng hou.node để lấy danh sách tất cả các node trong Houdini.
box, box1, box2: Các biến đại diện cho các đối tượng node kiểu Box.
clear: Một phương thức của đối tượng hou.node để xóa tất cả các node trong môi trường Houdini.
distance, duration, frame, frame_count, frame_time: Các biến được sử dụng để lưu trữ và tính toán thông tin về khoảng cách, thời gian khung hình và thời gian chạy của chương trình.
hou: Mô-đun Houdini Python API.
houdiniInterpreter: Đối tượng đại diện cho Python Shell của Houdini.
myGeo: Đối tượng node kiểu Geo được tạo ra.
name: Tên của mô-đun hiện tại.
node: Một phương thức của đối tượng hou.node để truy cập và tạo các node trong Houdini.
nodethemes: Mô-đun chứa các phương thức và lớp để làm việc với các theme (giao diện) của node trong Houdini.
obj: Đối tượng node kiểu Obj (Object) trong Houdini.
os: Mô-đun chứa các chức năng hệ điều hành liên quan.
pdg: Mô-đun chứa các chức năng liên quan đến PDG (Procedural Dependency Graph).
position, positionA, positionB: Các biến được sử dụng để lưu trữ thông tin về vị trí A, vị trí B và vị trí hiện tại của đối tượng.
schemautils: Mô-đun chứa các chức năng liên quan đến quản lý schema.
set_velocity: Một phương thức được định nghĩa để gán vận tốc cho đối tượng.
sleep: Một phương thức của đối tượng hou để tạm dừng chương trình trong một khoảng thời gian nhất định.
system: Mô-đun chứa các chức năng liên quan đến hệ thống và môi trường.
torus: Biến đại diện cho đối tượng node kiểu Torus.
velocity: Biến để lưu trữ giá trị vận tốc.




# HOU NODE
import hou
obj = hou.node("/obj")
box = hou.node("/obj").createNode("geo").createNode("box")
box.parent().createNode("color").setFirstInput(box)
wire_node = box.parent().createNode("wire")

wire_node.setFirstInput(box)
# thay đổi thuộc tính radius về 0.05
wire_node.parm("radius").set(0.05)


color_node = hou.node("/obj/geo1").createNode("color").setFirstInput(wire_node)

# Merge 2 node:
merge_node = hou.node("/obj/geo1").createNode("merge")
>>> merge_node.setInput(0, hou.node("/obj/geo1/color1"))
>>> merge_node.setInput(1, hou.node("/obj/geo1/color2"))


