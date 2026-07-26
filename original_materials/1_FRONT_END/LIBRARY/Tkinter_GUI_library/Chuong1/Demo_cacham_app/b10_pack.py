#show you how to use the pack geometry manager to arrange widgets on a window.

import tkinter as tk

root = tk.Tk()
root.title('Pack Demo')
root.geometry("350x200")

# box 1
box1 = tk.Label(root, text="Box 1", bg="green", fg="white")
box1.pack()

# box 2
box2 = tk.Label(root, text="Box 2", bg="red", fg="white")
box2.pack()

root.mainloop()