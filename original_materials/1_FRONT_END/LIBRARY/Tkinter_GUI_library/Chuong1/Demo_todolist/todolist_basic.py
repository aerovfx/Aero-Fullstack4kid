
#Bước 1: Import các module cần thiết
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

# Bước 2: Cấu hình cửa sổ của ứng dụng
    
ws = Tk()
ws.geometry('500x450+500+200')
ws.title('PythonGuides')
ws.config(bg='#223441')
ws.resizable(width=False, height=False)


#Bước 3: Tạo frame
frame = Frame(ws)
frame.pack(pady=10)

#Bước 4: thêm Listbox
lb = Listbox(
    frame,
    width=25,
    height=8,
    font=('Times', 18),
    bd=0,
    fg='#464646',
    highlightthickness=0,
    selectbackground='#a6a6a6',
    activestyle="none",
    
)
lb.pack(side=LEFT, fill=BOTH)

#Bước 5:  Thêm dữ liệu nền
task_list = [
    'Thức dậy',
    'Vệ sinh cá nhân',
    'Đi làm bài tập toán',
    'Ăn sáng',
    'Đến trường',
    'Học 5 tiết',
    'Gặp gỡ bạn mới',
    'Về nhà'
    ]


for item in task_list:
    lb.insert(END, item)

#Bước 6: Thêm thanh trượt Scrollbars

sb = Scrollbar(frame)
sb.pack(side=RIGHT, fill=BOTH)

lb.config(yscrollcommand=sb.set)
sb.config(command=lb.yview)

#Bước 7: Thêm box nhập dữ liệu Entry Box
my_entry = Entry(
    ws,
    font=('times', 24)
    )

my_entry.pack(pady=20)

#Bước 8: Thêm frame cho nút
button_frame = Frame(ws)
button_frame.pack(pady=20)

#Bước 10: Thêm hàm newTask(), thêm công việc
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


#Bước 11: Thêm hàm deleteTask(), xoá công việc
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