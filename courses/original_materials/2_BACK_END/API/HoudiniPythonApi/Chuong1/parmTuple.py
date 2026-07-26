import hou

# Tạo đối tượng node kiểu Box
box = hou.node("/obj").createNode("geo").createNode("box")
box.parmTuple("t").set((-5, 0, 0))  # Thiết lập vị trí ban đầu

# Tạo đối tượng node kiểu Sphere
sphere = hou.node("/obj").createNode("geo").createNode("sphere")
sphere.parmTuple("t").set((5, 0, 0))  # Thiết lập vị trí ban đầu

# Tạo đối tượng node kiểu Torus
torus = hou.node("/obj").createNode("geo").createNode("torus")
torus.parmTuple("t").set((0, 5, 0))  # Thiết lập vị trí ban đầu
