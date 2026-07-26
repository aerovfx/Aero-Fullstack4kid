import tkinter as tk
from tkinter import ttk

#Hàm xử lý khi nhấn phím Return trên button
def return_pressed(event):
    print('Return key pressed.')

#Hàm ghi log sự kiện
def log(event):
    print(event)

#Khởi tạo giao diện đồ họa
root = tk.Tk()

#Tạo button có chữ 'Save', Gán sự kiện cho phím Return trên button và thực hiện cả hàm log
btn = ttk.Button(root, text='Save')
btn.bind('<Return>', return_pressed)
btn.bind('<Return>', log, add='+')

#Thiết lập focus cho button và đặt button vào giao diện
btn.focus()
btn.pack(expand=True)

root.mainloop()