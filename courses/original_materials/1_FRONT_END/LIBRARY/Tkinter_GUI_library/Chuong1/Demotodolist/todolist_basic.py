
#Import các module cần thiết
from tkinter import *
from tkinter import messagebox

#Thêm cảnh báo khi để trắng công việc và ấn nút
def newTask():
    task = my_entry.get()
    if task != "":
        lb.insert(END, task)
        my_entry.delete(0, "end")
    else:
        messagebox.showwarning("warning", "Please enter some task.")

#gọi hàm xoá công việc
def deleteTask():
    lb.delete(ANCHOR)

# Cấu hình cửa sổ của ứng dụng

ws = Tk()
ws.geometry('500x450+500+200') 
ws.title('PythonGuides')
ws.config(bg='#223441') 
ws.resizable(width=False, height=False)


#Tạo frame
frame = Frame(ws)
frame.pack(pady=10)

#Thêm Listbox
lb = Listbox( frame, width=25, height=8, font=('Times', 18), bd=0, fg='#464646', highlightthickness=0, selectbackground='#a6a6a6', activestyle="none",)
lb.pack(side=LEFT, fill=BOTH)












#Thêm dữ liệu nền Code:
task_list = [
    'Thức dậy',
    'Vệ sinh cá nhân',
    'Ăn sáng',
    'Học bài',
    'Đi học',
    'Gặp bạn bè',
    'Về nhà',

]


for item in task_list: 
    lb.insert(END, item)

#Thêm thanh trượt Scrollbars Code: 

sb = Scrollbar(frame)
sb.pack(side=RIGHT, fill=BOTH)

lb.config(yscrollcommand=sb.set) 
sb.config(command=lb.yview)

#Thêm box nhập dữ liệu Entry Box Code:
my_entry = Entry(ws, font=('times',24))
my_entry.pack(pady=20)





#Thêm frame cho nút Code:
button_frame = Frame(ws)
button_frame.pack(pady=20)

#Thêm hàm newtask
addTask_btn = Button(
    button_frame,
    text='Add Task',
    font=('times 14'),
    bg='#c5f776',
    padx=20,
    pady=10,
    command=newTask
)
addTask_btn.pack(fill=BOTH, expand=True, side=LEFT)


#Thêm hàm xóa
delTask_btn = Button(
    button_frame,
    text='Delete Task',
    font=('times 14'),
    bg='#ff8b61',
    padx=20,
    pady=10,
    command=deleteTask
)
delTask_btn.pack(fill=BOTH, expand=True, side=LEFT)


#gọi phương thức mainloop để giữ cửa sổ hiển thị
ws.mainloop()