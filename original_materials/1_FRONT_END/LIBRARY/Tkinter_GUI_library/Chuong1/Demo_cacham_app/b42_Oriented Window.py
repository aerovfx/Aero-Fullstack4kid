import tkinter as tk
from tkinter import ttk
from tkinter.messagebox import showinfo


class App(tk.Tk):
  def __init__(self):
    super().__init__()

    # configure the root window
    self.title('My First App')
    self.geometry('400x100')

    # label
    self.label = ttk.Label(self, text='Chào chủ nhân')
    self.label.pack()

    # button
    self.button = ttk.Button(self, text='Click Me')
    self.button['command'] = self.button_clicked
    self.button.pack()

  def button_clicked(self):
    showinfo(title='Bảng công việc', message='Hãy đọc tôi')

if __name__ == "__main__":
  app = App()
  app.mainloop()