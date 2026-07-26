import tkinter as tk
from tkinter import ttk
from collections import defaultdict
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

class Moneysaver:
    def __init__(self, master):
        self.master = master
        self.master.title("Money Saver")
        
        # Create a default dictionary to store expenses for each category
        self.expenses = defaultdict(float)
        
        # Create the GUI elements
        self.create_gui()
        
    def create_gui(self):
        # Create a frame to hold the expense entry form
        form_frame = ttk.Frame(self.master)
        form_frame.pack(padx=10, pady=10)
        
        # Create the form labels and entry fields
        ttk.Label(form_frame, text="Danh mục:").grid(row=0, column=0, padx=5, pady=5)
        self.category_var = tk.StringVar()
        ttk.Entry(form_frame, textvariable=self.category_var).grid(row=0, column=1, padx=5, pady=5)
        
        ttk.Label(form_frame, text="Tiền:").grid(row=1, column=0, padx=5, pady=5)
        self.amount_var = tk.StringVar()
        ttk.Entry(form_frame, textvariable=self.amount_var).grid(row=1, column=1, padx=5, pady=5)
        
        ttk.Button(form_frame, text="Thêm vào biểu đồ", command=self.add_expense).grid(row=2, column=1, padx=5, pady=5)
        
        # Create a frame to hold the chart
        chart_frame = ttk.Frame(self.master)
        chart_frame.pack(padx=10, pady=10)
        
        # Create the chart canvas
        self.figure, self.ax = plt.subplots(figsize=(5,5))
        self.canvas = FigureCanvasTkAgg(self.figure, chart_frame)
        self.canvas.get_tk_widget().pack()
        
    def add_expense(self):
        # Get the category and amount from the entry fields
        category = self.category_var.get()
        amount = float(self.amount_var.get())
        
        # Add the expense to the category in the dictionary
        self.expenses[category] += amount
        
        # Clear the entry fields
        self.category_var.set("")
        self.amount_var.set("")
        
        # Update the chart
        self.update_chart()
        
    def update_chart(self):
        # Clear the chart
        self.ax.clear()
        
        # Get the categories and amounts from the dictionary
        categories = list(self.expenses.keys())
        amounts = list(self.expenses.values())
        
        # Create the chart
        self.ax.pie(amounts, labels=categories, autopct='%1.1f%%', startangle=90)
        self.ax.axis('equal')
        self.figure.tight_layout()
        
        # Draw the chart
        self.canvas.draw()
        
if __name__ == "__main__":
    root = tk.Tk()
    app = Moneysaver(root)
    root.mainloop()
