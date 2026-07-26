# Dòng này nhúng module hou để có thể sử dụng Houdini Python API.
import hou 

# Dòng này tạo một biến obj và gán nó bằng đối tượng node "/obj" trong Houdini.
#"/obj" là thư mục mặc định chứa các đối tượng (objects) trong Houdini.
obj = hou.node("/obj") # gán biến obj cho đường dẫn này để tiện gọi lại nó.

# Dòng này tạo một đối tượng node kiểu "geo" trong obj (thư mục "/obj") và gán nó cho biến myGeo.
# "geo" là một loại node trong Houdini dùng để chứa các đối tượng hình học (geometry).
#myGeo là một biến 
myGeo = obj.createNode("geo", "testGeo")

# Dòng này tạo một đối tượng node kiểu "box" trong myGeo (đối tượng "geo" đã tạo trước đó) và gán nó cho biến box. 
# "box" là một loại node trong Houdini dùng để tạo hình hộp.
box = myGeo.createNode("box", "myBox")

# Dòng này tạo một đối tượng node kiểu "sphere" trong myGeo và gán nó cho biến sphere. 
# "sphere" là một loại node trong Houdini dùng để tạo hình cầu.
sphere = myGeo.createNode("sphere", "mySphere")


# Dòng này tạo một đối tượng node kiểu "grip" trong myGeo và gán nó cho biến grip. 
# "grid" là một loại node trong Houdini dùng để tạo mặt phẳng.
grid = myGeo.createNode("grid", "myGrid")



# Dòng này tạo một đối tượng node kiểu "torus" trong myGeo và gán nó cho biến torus.
# "torus" là một loại node trong Houdini dùng để tạo hình vòng donut.
torus = myGeo.createNode("torus","myTorus")


# Tổng quan, đoạn mã trên tạo một đối tượng node kiểu "geo" trong thư mục "/obj", 
# sau đó tạo và gán các đối tượng node kiểu "box", "sphere", "box" và "torus" 
# vào trong đối tượng "geo" đã tạo.



