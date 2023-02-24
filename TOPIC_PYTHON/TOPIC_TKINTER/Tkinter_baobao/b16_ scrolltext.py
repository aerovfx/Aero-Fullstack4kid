# ScrolledText - show you how to create a scrolled text widget that consists of Text and vertical scrollbarwidget.
import tkinter as tk
from tkinter.scrolledtext import ScrolledText


class App(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("ScrolledText Widget")
        st = ScrolledText(self, width=50, height=10)
        
       
        
    if __name__ == "__main__":
        app = App()
        app.mainloop()