# Tkinter Label widget is used to display a text or image on the screen. To use a Label widget, you use the following general syntax:
#import module tkinter và đặt tên là tk
mport tkinter as tk
from tkinter.ttk import Label

#tạo instance của lớp Tk, tạo của sổ kích thức 300x200, không điều chỉnh kích thước được và có tiêu đề

root = tk.Tk()
root.geometry('300x200')
root.resizable(False, False)
root.title('Tiêu đề: Demo Label')

# Hiển thị tiêu đề 
label = Label(root, text='This is a label')
label.pack(ipadx=10, ipady=10)


#Hiển thị cửa sổ
root.mainloop()
