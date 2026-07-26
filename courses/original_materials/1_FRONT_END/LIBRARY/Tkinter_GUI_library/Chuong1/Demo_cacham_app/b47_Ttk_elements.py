import tkinter as tk
from tkinter import ttk


class App(tk.Tk):
    def __init__(self):
        super().__init__()

        self.geometry('500x100')

        message = 'This is an error message!'

        label = ttk.Label(self, text=message, style='Error.TLabel')
        label.pack(expand=True)

        style = ttk.Style(self)

        style.configure('Error.TLabel', foreground='white')
        style.configure('Error.TLabel', background='red')
        style.configure('Error.TLabel', font=('Helvetica', 12))
        style.configure('Error.TLabel', padding=(10, 10))


if __name__ == "__main__":
    app = App()
    app.mainloop()