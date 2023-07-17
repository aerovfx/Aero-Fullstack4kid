import tkinter as tk

# Create the main window
root = tk.Tk()
root.title("Giải Phương Trình Bậc 1")

# Tạo các tiện ích nhãn và mục nhập cho a và b
a_label = tk.Label(root, text="nhập vào hệ số a: ")
a_label.grid(row=0, column=0)

a_entry = tk.Entry(root)
a_entry.grid(row=0, column=1)

b_label = tk.Label(root, text="nhập vào hệ số b: ")
b_label.grid(row=1, column=0)

b_entry = tk.Entry(root)
b_entry.grid(row=1, column=1)

# Create the function to solve the equation and display the result
def solve():
    a = float(a_entry.get())
    b = float(b_entry.get())
    if a == 0:
        if b == 0:
            result_label.config(text="phương trình vô số nghiệm (mọi giá trị của x đều thoả )")
        else:
            result_label.config(text="Phương trình vô nghiệm (không có giá trị nào của x thoả mãn nó)")
    else:
        x = -b / a
        result_label.config(text=f"Nghiệm phương trình là x = {x}")
        
# Create the solve button and the label to display the result
solve_button = tk.Button(root, text="Tính toán", command=solve)
solve_button.grid(row=2, column=0)

result_label = tk.Label(root, text="")
result_label.grid(row=2, column=1)

# Run the main event loop
root.mainloop()