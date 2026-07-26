#Canvas – introduce you to the Canvas widget.
import tkinter as tk

root = tk.Tk()
root.geometry('800x600')
root.title('Canvas Demo')

canvas = tk.Canvas(root, width=600, height=400, bg='white')
canvas.pack(anchor=tk.CENTER, expand=True)


canvas.create_line((50, 50), (100, 100), width=4, fill='red')

# create a rectangle
canvas.create_rectangle((100, 100), (300, 300), fill='green')

# create a oval
points = (
    (50, 150),
    (200, 350),
)
canvas.create_oval(*points, fill='purple')

# create a polygon
points = (
    (100, 300),
    (200, 200),
    (300, 300),
)
canvas.create_polygon(*points, fill='blue')

#create text
canvas.create_text(
    (300, 100),
    text="Canvas Demo",
    fill="orange",
    font='tkDefaeultFont 24'
)

root.mainloop()