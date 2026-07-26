#mport hai thư viện tkinter và ttk.
import tkinter as tk
from tkinter import ttk


#Tạo một đối tượng root là cửa sổ chính (main window) của chương trình.
root = tk.Tk()

#là hàm được định nghĩa để in ra giá trị của tham số option.
def select(option):
    print(option)

#tạo ra 3 nút trên giao diện với 3 mục đích:
#In chữ Rock, Paper, Scissor.
ttk.Button(root, text='Rock', command=lambda: select('Rock')).pack()
ttk.Button(root, text='Paper',command=lambda: select('Paper')).pack()
ttk.Button(root, text='Scissors', command=lambda: select('Scissors')).pack()

root.mainloop()