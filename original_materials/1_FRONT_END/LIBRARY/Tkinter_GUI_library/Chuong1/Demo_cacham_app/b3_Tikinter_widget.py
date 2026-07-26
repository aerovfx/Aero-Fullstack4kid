#mport hai thư viện tkinter và ttk.
import tkinter as tk
from tkinter import ttk

#Tạo một đối tượng root là cửa sổ chính (main window) của chương trình.
root = tk.Tk()

#Tạo một nhãn văn bản thông thường (classic label) bằng lệnh tk.Label(root, text='Classic Label') và đặt nó vào cửa sổ root bằng phương thức pack(). Tạo một nhãn văn bản được thiết kế (themed label) bằng lệnh ttk.Label(root, text='Themed Label') và đặt nó vào cửa sổ root bằng phương thức pack().


tk.Label(root, text='Classic Label').pack()
ttk.Label(root, text='Themed Label').pack()


#Cuối cùng, gọi phương thức mainloop() để chương trình chạy và hiển thị cửa sổ.
root.mainloop()

'''
Những ttk widgets khác thường được dùng.
Tkinter.ttk

Button
Checkbutton
Entry
Frame
Label
LabelFrame
Menubutton
PanedWindow
Radiobutton
Scale
Scrollbar
Spinbox
And the following widgets are new and specific to ttk:

Combobox
Notebook
Progressbar
Separator
Sizegrip
Treeview
'''