import tkinter as tk
from tkinter import ttk
from PIL import Image, ImageTk


class App(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title('Tkinter PhotoImage Demo')

        self.image = Image.open('./STATIC/todolist.jpg')
        self.python_image = ImageTk.PhotoImage(self.image)

        ttk.Label(self, image=self.python_image).pack()


if __name__ == '__main__':
    app = App()
    app.mainloop()