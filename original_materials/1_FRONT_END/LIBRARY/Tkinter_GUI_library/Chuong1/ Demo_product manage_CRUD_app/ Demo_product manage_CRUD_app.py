import tkinter as tk
from tkinter import messagebox

class ProductManager:
    def __init__(self, master):
        self.master = master
        self.master.title("Product Manager")
        self.master.geometry("400x400")

        # Create category listbox
        self.categories_listbox = tk.Listbox(self.master)
        self.categories_listbox.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        # Create category label and entry
        self.category_label = tk.Label(self.master, text="Category Name:")
        self.category_label.pack()
        self.category_entry = tk.Entry(self.master)
        self.category_entry.pack()

        # Create category button frame
        self.category_button_frame = tk.Frame(self.master)
        self.category_button_frame.pack()
        self.add_category_button = tk.Button(self.category_button_frame, text="Add Category", command=self.add_category)
        self.add_category_button.pack(side=tk.LEFT)
        self.edit_category_button = tk.Button(self.category_button_frame, text="Edit Category", command=self.edit_category)
        self.edit_category_button.pack(side=tk.LEFT)
        self.delete_category_button = tk.Button(self.category_button_frame, text="Delete Category", command=self.delete_category)
        self.delete_category_button.pack(side=tk.LEFT)

        # Create order listbox
        self.orders_listbox = tk.Listbox(self.master)
        self.orders_listbox.pack(side=tk.LEFT, fill=tk.BOTH, expand=True)

        # Create order label and entry
        self.order_label = tk.Label(self.master, text="Order Name:")
        self.order_label.pack()
        self.order_entry = tk.Entry(self.master)
        self.order_entry.pack()

        # Create order button frame
        self.order_button_frame = tk.Frame(self.master)
        self.order_button_frame.pack()
        self.add_order_button = tk.Button(self.order_button_frame, text="Add Order", command=self.add_order)
        self.add_order_button.pack(side=tk.LEFT)
        self.edit_order_button = tk.Button(self.order_button_frame, text="Edit Order", command=self.edit_order)
        self.edit_order_button.pack(side=tk.LEFT)
        self.delete_order_button = tk.Button(self.order_button_frame, text="Delete Order", command=self.delete_order)
        self.delete_order_button.pack(side=tk.LEFT)

        # Populate category and order listboxes
        self.populate_categories_listbox()
        self.populate_orders_listbox()

    def populate_categories_listbox(self):
        self.categories_listbox.delete(0, tk.END)
        categories = ["Books", "Electronics", "Clothing"]
        for category in categories:
            self.categories_listbox.insert(tk.END, category)

    def populate_orders_listbox(self):
        self.orders_listbox.delete(0, tk.END)
        orders = ["Order 1", "Order 2", "Order 3"]
        for order in orders:
            self.orders_listbox.insert(tk.END, order)

    def add_category(self):
        category = self.category_entry.get()
        if category == "":
            messagebox.showerror("Error", "Category name cannot be blank.")
        else:
            self.categories_listbox.insert(tk.END, category)
            self.category_entry.delete(0, tk.END)

    def edit_category(self):
        selection = self.categories_listbox.curselection()
        if not selection:
            messagebox.showerror("Error", "Please select a category to edit.")
        else:
            category = self.categories_listbox.get(selection[0])
            new_category = self.category_entry.get()
            if new_category == "":
                messagebox.showerror("Error", "Category name cannot be blank.")
            else:               
                self.categories_listbox.insert(selection[0], new_category)
                self.category_entry.delete(0, tk.END)

    def delete_category(self):
        selection = self.categories_listbox.curselection()
        if not selection:
            messagebox.showerror("Error", "Please select a category to delete.")
        else:
            self.categories_listbox.delete(selection[0])

    def add_order(self):
        order = self.order_entry.get()
        if order == "":
            messagebox.showerror("Error", "Order name cannot be blank.")
        else:
            self.orders_listbox.insert(tk.END, order)
            self.order_entry.delete(0, tk.END)

    def edit_order(self):
        selection = self.orders_listbox.curselection()
        if not selection:
            messagebox.showerror("Error", "Please select an order to edit.")
        else:
            order = self.orders_listbox.get(selection[0])
            new_order = self.order_entry.get()
            if new_order == "":
                messagebox.showerror("Error", "Order name cannot be blank.")
            else:
                self.orders_listbox.delete(selection[0])
                self.orders_listbox.insert(selection[0], new_order)
                self.order_entry.delete(0, tk.END)

    def delete_order(self):
        selection = self.orders_listbox.curselection()
        if not selection:
            messagebox.showerror("Error", "Please select an order to delete.")
        else:
            self.orders_listbox.delete(selection[0])

root = tk.Tk()
app = ProductManager(root)
root.mainloop()
