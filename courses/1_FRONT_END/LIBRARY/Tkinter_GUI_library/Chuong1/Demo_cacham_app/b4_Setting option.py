#mport hai thư viện tkinter và ttk.
import tkinter as tk
from tkinter import ttk

#Tạo một đối tượng root là cửa sổ chính (main window) của chương trình.
root = tk.Tk()

label = ttk.Label(root)
label.config(text='Hi, there')
label.pack()


#Cuối cùng, gọi phương thức mainloop() để chương trình chạy và hiển thị cửa sổ.
root.mainloop()