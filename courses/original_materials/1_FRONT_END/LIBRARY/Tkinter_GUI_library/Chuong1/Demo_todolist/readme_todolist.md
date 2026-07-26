#Xây dựng ứng dụng to do list quản lí nhắc nhở việc làm hằng ngày.
#Hướng mở rộng sử dụng Swift để tích hợp lên Apple watch

Bài tập demo đầu tiên là tạo 1 to do list đơn giản nhất có thể chỉ có chức năng thêm công việc và xoá công việc.
<img width="511" alt="Screenshot 2023-02-27 at 17 43 14" src="https://user-images.githubusercontent.com/109997053/221542917-1b604de1-e3da-4440-bd9a-91eda183ea11.png">

1. Chuẩn bị:
Listbox: Chúng ta sẽ sử dụng Listbox của Python Tkinter để hiển thị nhiều nhiệm vụ được xếp chồng lên nhau. Và các nhiệm vụ có thể được chọn khi nhấp vào chúng.

Scrollbars: Scrollbars sẽ giúp chúng ta xếp chồng được nhiều dữ liệu mà không cần phải lo lắng về không gian trên cửa sổ. Các nhiệm vụ có thể được truy cập bằng cách cuộn Listbox.

Frame: Frame sẽ được sử dụng để đặt các widget như Listbox và Scrollbars bên trong. Điều này sẽ cho phép chúng ta kiểm soát việc căn chỉnh Listbox sang trái và thanh cuộn sang phải để chúng xuất hiện song song và hoàn hảo.

Buttons: Chúng ta sẽ thêm hai widget nút trên cửa sổ. Một là để thêm nhiều nhiệm vụ hơn vào Listbox và một là để xóa các nhiệm vụ khỏi Listbox.

Entry box: Người dùng sẽ nhập nhiệm vụ vào hộp nhập liệu và nhiệm vụ sẽ được hiển thị trong Listbox.

Messagebox: Hộp thoại thông báo Tkinter của Python được sử dụng để hiển thị thông báo lỗi khi người dùng nhấp vào nút thêm với hộp nhập liệu trống.


Bước 1: Import các module cần thiết

from tkinter import *
from tkinter import messagebox

Bước 2: Cấu hình cửa sổ của ứng dụng

ws = Tk()
# ws.geometry(‘width x height + x-position+ y-position’)
ws.geometry('500x450+500+200')
ws.title('PythonGuides')
ws.config(bg='#223441')
ws.resizable(width=False, height=False)

....
....

ws.mainloop()

Bước 3: Tạo frame

frame = Frame(ws)
frame.pack(pady=10)

Bước 4: thêm Listbox

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

Giải thích:
Tạo một đối tượng Listbox với các thuộc tính sau:

lb = Listbox(
frame, # đặt Listbox vào frame
width=25, # đặt chiều rộng của Listbox là 25
height=8, # đặt chiều cao của Listbox là 8
font=('Times', 18), # đặt kiểu phông chữ và kích thước của chữ hiển thị trong Listbox
bd=0, # đặt độ rộng của đường viền của Listbox
fg='#464646', # đặt màu chữ của các mục trong Listbox
highlightthickness=0, # đặt độ rộng của viền được tô sáng khi Listbox được chọn
selectbackground='#a6a6a6', # đặt màu nền của các mục được chọn trong Listbox
activestyle="none", # đặt kiểu hiển thị của vùng được chọn trong Listbox
)
lb.pack(side=LEFT, fill=BOTH) # đặt Listbox vào bên trái của frame và lấp đầy không gian theo cả hai chiều.

Bước 5:  Thêm dữ liệu nền

Code:
task_list = [
    'Thức dậy,
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

Bước 6: Thêm thanh trượt Scrollbars
Code:
sb = Scrollbar(frame)
sb.pack(side=RIGHT, fill=BOTH)

lb.config(yscrollcommand=sb.set)
sb.config(command=lb.yview)

Bước 7: Thêm box nhập dữ liệu Entry Box
Code:
my_entry = Entry(
    ws,
    font=('times', 24)
    )

my_entry.pack(pady=20)

Bước 8: Thêm frame cho nút
Code:
button_frame = Frame(ws)
button_frame.pack(pady=20)

Bước 9: thêm nút
Code:
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

Bước 10: Thêm hàm newTask(), thêm công việc
Code:
def newTask():
    task = my_entry.get()
    if task != "":
        lb.insert(END, task)
        my_entry.delete(0, "end")
    else:
        messagebox.showwarning("warning", "Please enter some task.")


Chú thích:
Trong hàm này, chúng ta đã lưu giá trị của hộp nhập liệu vào biến task.
Phương thức get() được sử dụng để lấy giá trị do người dùng cung cấp trong hộp nhập liệu.
Điều kiện if-else được áp dụng để tránh việc nhập khoảng trống vào trong Listbox.
Nếu tác vụ không có khoảng trắng, nó chỉ cho phép lưu thông tin trong Listbox. Nếu không, nó sẽ hiển thị một hộp thoại cảnh báo để thông báo cho người dùng biết rằng hộp nhập liệu không thể để trống.

Bước 11: Thêm hàm deleteTask(), xoá công việc
Code 
def deleteTask():
    lb.delete(ANCHOR)


