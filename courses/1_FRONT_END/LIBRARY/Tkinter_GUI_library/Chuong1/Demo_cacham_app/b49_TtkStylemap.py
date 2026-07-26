'''
Import thư viện tkinter và ttk

import tkinter as tk
from tkinter import ttk

Tạo lớp App kế thừa từ lớp tk.Tk

class App(tk.Tk):
def init(self):
super().init()
'''
import tkinter as tk
from tkinter import ttk


class App(tk.Tk):
    def __init__(self):
        super().__init__()
        # Thiết lập kích thước của cửa sổ là 300x100
        self.geometry('300x100')
        # Tạo nút Save
        button = ttk.Button(self, text='Save')
        # Thêm nút Save vào cửa sổ, expand=True để nút chiếm hết không gian của cửa sổ
        button.pack(expand=True)

        # Tạo style cho các widget được tạo trong App
        style = ttk.Style(self)
        # Cấu hình font chữ cho widget có kiểu TButton
        style.configure('TButton', font=('Helvetica', 16))
        # Thiết lập màu chữ cho các trạng thái pressed (nhấn nút) và active (chuột hover qua nút)
        style.map('TButton',
                foreground=[('pressed', 'blue'),
                            ('active', 'red')])

        # In ra layout của widget có kiểu TButton
        print(style.layout('TButton'))

#Kiểm tra xem nếu file được thực thi bởi Python trực tiếp thì mới chạy lệnh tiếp theo, tránh trường hợp file được import bởi một file khác
if __name__ == "__main__":
    app = App()
    app.mainloop()