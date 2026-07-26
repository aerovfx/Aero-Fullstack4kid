import hou

# Nhập chiều dài cạnh a từ người dùng
a = 5

# Tạo một đối tượng Geometry
geo = hou.node("/obj").createNode("geo", "Box_Geometry")

# Tạo một hộp vuông với chiều dài cạnh bằng a
box = geo.createNode("box")
box.parm("sizex").set(a)
box.parm("sizey").set(a)
box.parm("sizez").set(a)

# Hiển thị đối tượng lên màn hình render
render_node = hou.node("/out").createNode("render")
render_node.setRenderFlag(True)
render_node.setRenderBackground(True)
render_node.setRenderRegion(True)
render_node.setDisplayFlag(True)

# Kết nối đối tượng Geometry với màn hình render
box.setRenderFlag(True)
box.setRenderNode(render_node)

# Tự động chuyển đến màn hình render
hou.ui.curDesktop().setCurrentNode(render_node)
