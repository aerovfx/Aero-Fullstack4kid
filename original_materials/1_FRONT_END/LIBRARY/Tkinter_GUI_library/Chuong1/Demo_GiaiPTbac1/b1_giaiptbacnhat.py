import tkinter as tk

# create the main window
root = tk.Tk()
root.title("Giải phương trình bậc 1")

#create the label and entry widgets for a and b
a_label = tk.Label(root, text="Nhập vào hệ số a:")
a_label.grid(row=0, column=1)

a_entry = tk.Entry(root)
a_entry.grid(row=0, column=1)

b_label = tk.Label(root, text="Nhập vào hệ số b:")
b_label.grid(row=1, column=0)

b_entry = tk.Entry(root)
b_entry.grid(row=1, column=1)

#create the function to slove the equation and display the result
def solve():
    a = float(a_entry.get())
    b = float(b_entry.get())
    if a == 0:
        if b == 0:
            result_label.config(text="phương trình vô số nghiệm (mọi giá trị của x đều thỏa mãn)")
        else:
            result_label.config(text="Phương trình vô nghiệm (không có giá trị nào của x thỏa mãn nó)")
    else:
        x = -b / a
        result_label.config(text=f"Nghiệm phương trình là x = {x}")
        
#create the solve button and the label to display the result
solve_button = tk.Button(root, text="tính toán", command=solve)
solve_button.grid(row=2, column=0)

result_label = tk.Label(root, text="")
result_label.grid(row=2, column=1)

#run the main event loop
root.mainloop()