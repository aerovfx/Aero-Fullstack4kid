import tkinter as tk
from tkinter import ttk
from tkinter.messagebox import showerror

# root window
root = tk.Tk()
root.title('Chuyển đổi độ F sang độ C')
root.geometry('500x90')
root.resizable(False, False)


def fahrenheit_to_celsius(f):
    """ Convert fahrenheit to celsius
    """
    return (f - 32) * 5/9


# frame
frame = ttk.Frame(root)


# field options
options = {'padx': 5, 'pady': 5}

# temperature label
temperature_label = ttk.Label(frame, text='Độ F')
temperature_label.grid(column=0, row=0, sticky='W', **options)

# temperature entry
temperature = tk.StringVar()
temperature_entry = ttk.Entry(frame, textvariable=temperature)
temperature_entry.grid(column=1, row=0, **options)
temperature_entry.focus()

# convert button


def convertF2C_button_clicked():
    """  Handle convert button click event 
    """
    try:
        f = float(temperature.get())
        c = fahrenheit_to_celsius(f)
        result = f'{f} F= {c:.2f} oC'
        result_label.config(text=result)
    except ValueError as error:
        showerror(title='Error', message=error)

#tạo giao diện chuyển đổi độ F sang độ C
convert_button = ttk.Button(frame, text='Chuyển đổi')
convert_button.grid(column=2, row=0, sticky='W', **options)
convert_button.configure(command=convertF2C_button_clicked)




# result label
result_label = ttk.Label(frame)
result_label.grid(row=1, columnspan=3, **options)

# add padding to the frame and show it
frame.grid(padx=0, pady=10)


# start the app
root.mainloop()