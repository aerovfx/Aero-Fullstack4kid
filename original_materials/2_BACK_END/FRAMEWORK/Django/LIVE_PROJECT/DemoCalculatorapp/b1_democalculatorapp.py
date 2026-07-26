# Python program to create a simple GUI
# calculator using Tkinter
# Chương trình Python để tạo GUI đơn giản
# máy tính sử dụng Tkinter

# import everything from tkinter module: nhập các module cần thiết của tkinter
from tkinter import *

# globally declare the expression variable
#khai báo biến toàn cục, 
expression = ""


# Đây là một hàm Python để cập nhật biểu thức trong hộp văn bản 
# bằng cách nối một chuỗi số vào biểu thức hiện tại.
def press(num):
	#từ khóa global được sử dụng để chỉ ra rằng biến expression 
    # là biến toàn cục được định nghĩa bên ngoài hàm. Điều này có nghĩa là 
    # bất kỳ thay đổi nào được thực hiện trên expression trong hàm sẽ ảnh hưởng 
    # đến giá trị của biến toàn cục.
	global expression

	# concatenation of string: nối chuỗi
	expression = expression + str(num)

	# update the expression by using set method: 
    # cập nhật biểu thức bằng cách sử dụng phương thức set
	equation.set(expression)


    # Function to evaluate the final expression
    # Chức năng đánh giá biểu thức cuối cùng
def equalpress():
	# thử và ngoại trừ được sử dụng
	# để xử lý các lỗi như số không
	# lỗi phép chia, ví dụ vậy
	# Đặt mã bên trong khối thử

	try:

		global expression

	# hàm eval đánh giá biểu thức
    # và hàm str chuyển đổi kết quả thành chuỗi
		total = str(eval(expression))

		equation.set(total)

    # khởi tạo biến biểu thức bằng chuỗi rỗng
		expression = ""

	# if error is generate then handle
	# by the except block
	except:

		equation.set(" error ")
		expression = ""


# Function to clear the contents
# of text entry box
def clear():
	global expression
	expression = ""
	equation.set("")


# Chạy mã lệnh
if __name__ == "__main__":
	# Tạo của sổ GUI
	gui = Tk()

	# Tạo nền cho background
	gui.configure(background="black")

	# Tạo tiêu đề với tên
	gui.title("Chương trình máy tính đơn giản")

	# Đăt kích thước cửa sổ là dài và rộng là 350 và 150
	gui.geometry("350x150")

    # StringVar() là lớp biến
    # chúng ta tạo một ví dụ của lớp này
	equation = StringVar()

    # tạo hộp nhập văn bản cho
    # hiển thị biểu thức .
	expression_field = Entry(gui, textvariable=equation)
 
    # phương pháp lưới được sử dụng để đặt
    # các vật dụng ở các vị trí tương ứng
    # trong bảng giống như cấu trúc.
	expression_field.grid(columnspan=4, ipadx=70)

    # tạo một Nút và đặt tại một vị trí cụ thể
    # vị trí bên trong cửa sổ gốc. Khi người dùng nhấn nút, lệnh hoặc
    # chức năng liên kết với nút đó được thực thi.
	button1 = Button(gui, text=' 1 ', fg='black', bg='light green',
					command=lambda: press(1), height=1, width=7)
	button1.grid(row=2, column=0)

	button2 = Button(gui, text=' 2 ', fg='black', bg='light green',
					command=lambda: press(2), height=1, width=7)
	button2.grid(row=2, column=1)

	button3 = Button(gui, text=' 3 ', fg='black', bg='light green',
					command=lambda: press(3), height=1, width=7)
	button3.grid(row=2, column=2)

	button4 = Button(gui, text=' 4 ', fg='black', bg='light green',
					command=lambda: press(4), height=1, width=7)
	button4.grid(row=3, column=0)

	button5 = Button(gui, text=' 5 ', fg='black', bg='yellow',
					command=lambda: press(5), height=1, width=7)
	button5.grid(row=3, column=1)

	button6 = Button(gui, text=' 6 ', fg='black', bg='light green',
					command=lambda: press(6), height=1, width=7)
	button6.grid(row=3, column=2)

	button7 = Button(gui, text=' 7 ', fg='black', bg='light green',
					command=lambda: press(7), height=1, width=7)
	button7.grid(row=4, column=0)

	button8 = Button(gui, text=' 8 ', fg='black', bg='light green',
					command=lambda: press(8), height=1, width=7)
	button8.grid(row=4, column=1)

	button9 = Button(gui, text=' 9 ', fg='black', bg='red',
					command=lambda: press(9), height=1, width=7)
	button9.grid(row=4, column=2)

	button0 = Button(gui, text=' 0 ', fg='black', bg='red',
					command=lambda: press(0), height=1, width=7)
	button0.grid(row=5, column=0)

	plus = Button(gui, text=' + ', fg='black', bg='red',
				command=lambda: press("+"), height=1, width=7)
	plus.grid(row=2, column=3)

	minus = Button(gui, text=' - ', fg='black', bg='red',
				command=lambda: press("-"), height=1, width=7)
	minus.grid(row=3, column=3)

	multiply = Button(gui, text=' * ', fg='black', bg='red',
					command=lambda: press("*"), height=1, width=7)
	multiply.grid(row=4, column=3)

	divide = Button(gui, text=' / ', fg='black', bg='red',
					command=lambda: press("/"), height=1, width=7)
	divide.grid(row=5, column=3)

	equal = Button(gui, text=' = ', fg='black', bg='red',
				command=equalpress, height=1, width=7)
	equal.grid(row=5, column=2)

	clear = Button(gui, text='Clear', fg='black', bg='red',
				command=clear, height=1, width=7)
	clear.grid(row=5, column='1')

	Decimal= Button(gui, text='.', fg='black', bg='red',
					command=lambda: press('.'), height=1, width=7)
	Decimal.grid(row=6, column=0)
 
 
	# khởi động GUI
	gui.mainloop()