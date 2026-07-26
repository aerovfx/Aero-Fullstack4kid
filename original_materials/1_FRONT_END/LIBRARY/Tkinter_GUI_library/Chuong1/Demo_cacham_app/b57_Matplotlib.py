'''Import các thư viện cần thiết

import tkinter as tk # thư viện tkinter để tạo GUI
import matplotlib # thư viện Matplotlib để tạo biểu đồ

Đặt backend của Matplotlib thành TkAgg để tương thích với Tkinter

matplotlib.use('TkAgg')

Import các class cần thiết từ thư viện Matplotlib

from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import (
FigureCanvasTkAgg,
NavigationToolbar2Tk
)

Định nghĩa class chính của ứng dụng

class App(tk.Tk):
def init(self):
super().init()
'''
import tkinter as tk
import matplotlib
#chú ý cài đặt module matplotlib với cú pháp:
#pip installl matplotlib

# Set the backend to TkAgg to use Tkinter with Matplotlib
matplotlib.use('TkAgg')

from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import (
    FigureCanvasTkAgg,
    NavigationToolbar2Tk
)


class App(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title('Tkinter Matplotlib Demo')

        # Prepare the data for the chart
        data = {
            'Python': 11.27,
            'C': 11.16,
            'Java': 10.46,
            'C++': 7.5,
            'C#': 5.26
        }
        languages = data.keys()
        popularity = data.values()

        # Create a new figure for the chart
        figure = Figure(figsize=(6, 4), dpi=100)

        # Create a FigureCanvasTkAgg object to embed the chart in the tkinter GUI
        figure_canvas = FigureCanvasTkAgg(figure, self)

        # Create a navigation toolbar for the chart
        NavigationToolbar2Tk(figure_canvas, self)

        # Add a new subplot (axes) to the figure
        axes = figure.add_subplot()

        # Create the bar chart using the data
        axes.bar(languages, popularity)
        axes.set_title('Top 5 Programming Languages') # Đặt tiêu đề biểu đồ cột
        axes.set_ylabel('Popularity') # Đặt nhãn cho trục y

        # Pack the FigureCanvasTkAgg object into the GUI
        figure_canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)


if __name__ == '__main__':
    app = App()
    app.mainloop()
