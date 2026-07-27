#import modules
import tkinter as tk
from tkinter import messagebox

def solve_quadratic():
#Hàm giải phương trình bậc 2, nhập hệ số a, b, c
    try:
        a = float(a_entry.get())
        b = float(b_entry.get())
        c = float(c_entry.get())

        # calculate discriminant, tính delta
        discriminant = b**2 - 4*a*c

        # calculate roots
        if discriminant < 0:
            raise ValueError("Phương trình vô nghiệm.")
        elif discriminant == 0:
            x1 = -b / (2*a)
            x2 = x1
        else:
            x1 = (-b + discriminant**0.5) / (2*a)
            x2 = (-b - discriminant**0.5) / (2*a)

        # update output labels
        x1_label.config(text=f"x1 = {x1}")
        x2_label.config(text=f"x2 = {x2}")
    except ValueError as e:
        messagebox.showerror("Error", str(e))

# create tkinter window
root = tk.Tk()
root.geometry('250x150+300+150')
root.title("Giải phương trình bậc 2")

# create input labels and entry boxes
a_label = tk.Label(root, text="a:")
a_entry = tk.Entry(root)
b_label = tk.Label(root, text="b:")
b_entry = tk.Entry(root)
c_label = tk.Label(root, text="c:")
c_entry = tk.Entry(root)

# create solve button
solve_button = tk.Button(root, text="Giải bài toán", command=solve_quadratic)

# create output labels
x1_label = tk.Label(root, text="")
x2_label = tk.Label(root, text="")

# lay out widgets using grid method
a_label.grid(row=0, column=0)
a_entry.grid(row=0, column=1)
b_label.grid(row=1, column=0)
b_entry.grid(row=1, column=1)
c_label.grid(row=2, column=0)
c_entry.grid(row=2, column=1)

#Layout solve button 
solve_button.grid(row=3, column=0, columnspan=2)
x1_label.grid(row=4, column=0, columnspan=2)
x2_label.grid(row=5, column=0, columnspan=2)

# start the main loop
root.mainloop()
