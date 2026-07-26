import tkinter as tk
import pandas as pd
import matplotlib.pyplot as plt
from datetime import datetime

class DrugSalesApp:
    def __init__(self, master):
        self.master = master
        master.title("Drug Sales App")

        # Initialize variables
        self.drug_name = tk.StringVar()
        self.drug_qty = tk.IntVar()
        self.drug_category = tk.StringVar()
        self.orders = []

        # Create widgets
        tk.Label(master, text="Drug Name:").grid(row=0, column=0)
        tk.Entry(master, textvariable=self.drug_name).grid(row=0, column=1)
        tk.Label(master, text="Quantity:").grid(row=1, column=0)
        tk.Entry(master, textvariable=self.drug_qty).grid(row=1, column=1)
        tk.Label(master, text="Category:").grid(row=2, column=0)
        tk.Entry(master, textvariable=self.drug_category).grid(row=2, column=1)
        tk.Button(master, text="Add Order", command=self.add_order).grid(row=3, column=0)
        tk.Button(master, text="Show Statistics", command=self.show_statistics).grid(row=3, column=1)

    def add_order(self):
        drug = self.drug_name.get()
        qty = self.drug_qty.get()
        category = self.drug_category.get()
        timestamp = datetime.now()
        self.orders.append((drug, qty, category, timestamp))

    def show_statistics(self):
        df = pd.DataFrame(self.orders, columns=["Drug", "Qty", "Category", "Timestamp"])
        df["Timestamp"] = pd.to_datetime(df["Timestamp"])
        df.set_index("Timestamp", inplace=True)

        # Daily Sales Bar Chart by Category
        daily_sales = df.groupby(['Category', pd.Grouper(freq='D')])['Qty'].sum().unstack(level=0)
        daily_sales.plot(kind='bar')
        plt.xlabel('Date')
        plt.ylabel('Sales Quantity')
        plt.title('Daily Sales by Category')
        plt.show()

        # Monthly Sales Line Chart by Category
        monthly_sales = df.groupby(['Category', pd.Grouper(freq='M')])['Qty'].sum().unstack(level=0)
        monthly_sales.plot(kind='line')
        plt.xlabel('Month')
        plt.ylabel('Sales Quantity')
        plt.title('Monthly Sales by Category')
        plt.show()


root = tk.Tk()
app = DrugSalesApp(root)
root.mainloop()
