#place – show you how to use the place geometry manager to precisely position widgets within its container using the (x, y) coordinate system.

import tkinter as tk

root = tk.Tk()
root.title('Tkinter place Geometry Manager')

# label 1
label1 = tk.Label(
    root,
    text="Giữ nguyên toạ độ",
    bg='red',
    fg='white'
)

label1.place(x=20, y=10)

# label 2
label2 = tk.Label(
    root,
    text="Thay đổi toạ độ khi scale cửa sổ",
    bg='blue',
    fg='white'
)

label2.place(relx=0.8, rely=0.2, relwidth=0.5, anchor='ne')

root.mainloop()
