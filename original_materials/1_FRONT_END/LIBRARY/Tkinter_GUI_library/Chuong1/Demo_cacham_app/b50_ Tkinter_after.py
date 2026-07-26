import tkinter as tk
from tkinter import ttk
import time


class DigitalClock(tk.Tk):
    def __init__(self):
        super().__init__()

        # configure the root window
        self.title('Digital Clock')
        self.resizable(0, 0)
        self.geometry('250x80')
        self['bg'] = 'black'

        # change the background color to black
        self.style = ttk.Style(self)
        self.style.configure(
            'TLabel',
            background='black',
            foreground='red')

        # label
        self.label = ttk.Label(
            self,
            text=self.time_string(),
            font=('Digital-7', 40))

        self.label.pack(expand=True)

        # schedule an update every 1 second
        self.label.after(1000, self.update)

    def time_string(self):
        return time.strftime('%H:%M:%S')

    def update(self):
        """ update the label every 1 second """

        self.label.configure(text=self.time_string())

        # schedule another timer
        self.label.after(1000, self.update)


if __name__ == "__main__":
    clock = DigitalClock()
    clock.mainloop()
