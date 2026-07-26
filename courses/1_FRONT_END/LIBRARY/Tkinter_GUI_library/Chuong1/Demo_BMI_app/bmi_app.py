import tkinter as tk

def calculate_bmi():
    try:
        weight = float(weight_entry.get())
        height = float(height_entry.get())
        bmi = weight / (height/100)**2
        result_label.config(text=f"Your BMI is: {bmi:.2f}")
    except ValueError:
        result_label.config(text="Invalid input, please try again.")

root = tk.Tk()
root.title("Chỉ số BMI")

# Create labels and entries for weight and height
weight_label = tk.Label(root, text="Cân nặng (kg):")
weight_label.grid(row=0, column=0, padx=5, pady=5, sticky="w")
weight_entry = tk.Entry(root)
weight_entry.grid(row=0, column=1, padx=5, pady=5)

height_label = tk.Label(root, text="Chiều cao (cm):")
height_label.grid(row=1, column=0, padx=5, pady=5, sticky="w")
height_entry = tk.Entry(root)
height_entry.grid(row=1, column=1, padx=5, pady=5)

# Create button to calculate BMI
calculate_button = tk.Button(root, text="Chỉ số BMI", command=calculate_bmi)
calculate_button.grid(row=2, column=0, padx=5, pady=5)

# Create label to display result
result_label = tk.Label(root, text="")
result_label.grid(row=2, column=1, padx=5, pady=5)


root.mainloop()
