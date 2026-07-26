import tkinter as tk

def calculate_bmi():
    # get weight and height values from input boxes
    weight = float(weight_entry.get())
    height = float(height_entry.get())

    # calculate BMI
    bmi = weight / ((height/100) ** 2)

    # round BMI to 2 decimal places
    bmi = round(bmi, 2)

    # display BMI on the output label
    bmi_label.config(text=f"BMI: {bmi}")

    # check BMI and display report
    if bmi < 18.5:
        report_label.config(text="Bạn thiếu cân")
    elif bmi >= 18.5 and bmi <= 22:
        report_label.config(text="Bạn phát triển bình thường")
    elif bmi >= 23.0 and bmi <= 24.9:
            report_label.config(text="Bạn trong giai đoạn tiền béo phì")
    elif bmi >= 25.0 and bmi <= 29.9:
            report_label.config(text="Bạn trong giai đoạn Béo phì độ I")
    elif bmi >= 30.0:
            report_label.config(text="Bạn trong giai đoạn Béo phì độ II")

# create tkinter window
window = tk.Tk()
window.title("Tính toán chỉ số BMI")

# create labels and input boxes for weight and height
weight_label = tk.Label(text="Cân nặng (kg):")
weight_label.grid(row=0, column=0)

weight_entry = tk.Entry()
weight_entry.grid(row=0, column=1)

height_label = tk.Label(text="Chiều cao (cm):")
height_label.grid(row=1, column=0)

height_entry = tk.Entry()
height_entry.grid(row=1, column=1)

# create button to calculate BMI
calculate_button = tk.Button(text="Tính toán chỉ số BMI", command=calculate_bmi)
calculate_button.grid(row=2, column=0)

# create label to display BMI and report
bmi_label = tk.Label(text="")
bmi_label.grid(row=2, column=1)

report_label = tk.Label(text="")
report_label.grid(row=3, column=0, columnspan=2)

# start the tkinter event loop
window.mainloop()
