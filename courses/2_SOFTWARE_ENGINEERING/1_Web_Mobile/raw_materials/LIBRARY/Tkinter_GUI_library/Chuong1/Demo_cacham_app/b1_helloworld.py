
# Import module tkinter, Tkinter là module được sử dụng để tạo các ứng dụng desktop GUI cho Python.

import tkinter as tk

#tạo instance của lớp Tk
root = tk.Tk()

#Nội dung bên trong thân chương trình

message = tk.Label(root, text="Hello, World!")
message.pack()





#gọi phương thức mainloop để giữ cửa sổ hiển thị
root.mainloop()