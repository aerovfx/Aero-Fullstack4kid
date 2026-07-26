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
        self.orders = []

        # Create widgets
        tk.Label(master, text="Drug Name:").grid(row=0, column=0)
        tk.Entry(master, textvariable=self.drug_name).grid(row=0, column=1)
        tk.Label(master, text="Quantity:").grid(row=1, column=0)
        tk.Entry(master, textvariable=self.drug_qty).grid(row=1, column=1)
        tk.Button(master, text="Add Order", command=self.add_order).grid(row=2, column=0)
        tk.Button(master, text="Show Statistics", command=self.show_statistics).grid(row=2, column=1)

    def add_order(self):
        drug = self.drug_name.get()
        qty = self.drug_qty.get()
        timestamp = datetime.now()
        self.orders.append((drug, qty, timestamp))

    def show_statistics(self):
        df = pd.DataFrame(self.orders, columns=["Drug", "Qty", "Timestamp"])
        df["Timestamp"] = pd.to_datetime(df["Timestamp"])
        df.set_index("Timestamp", inplace=True)

        # Daily Sales Bar Chart
        daily_sales = df.resample('D').sum()
        daily_sales.plot(kind='bar', legend=False)
        plt.xlabel('Date')
        plt.ylabel('Sales Quantity')
        plt.title('Daily Sales')
        plt.show()

        # Monthly Sales Line Chart
        monthly_sales = df.resample('M').sum()
        monthly_sales.plot(kind='line', legend=False)
        plt.xlabel('Month')
        plt.ylabel('Sales Quantity')
        plt.title('Monthly Sales')
        plt.show()


root = tk.Tk()
app = DrugSalesApp(root)
root.mainloop()
