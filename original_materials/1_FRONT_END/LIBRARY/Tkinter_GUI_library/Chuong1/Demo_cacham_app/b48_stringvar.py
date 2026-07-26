import tkinter as tk
from tkinter import ttk


class App(tk.Tk):
    ERROR = 'Error.TLabel'
    SUCCESS = 'Success.TLabel'

    def __init__(self):
        super().__init__()
        self.title('Change Password')
        self.geometry("300x130")

        self.password_var = tk.StringVar()
        self.confirm_password_var = tk.StringVar()

        self.confirm_password_var.trace('w', self.validate)

        self.columnconfigure(0, weight=1)
        self.columnconfigure(1, weight=1)
        self.columnconfigure(2, weight=1)

        # set style
        self.style = ttk.Style(self)
        self.style.configure('Error.TLabel', foreground='red')
        self.style.configure('Success.TLabel', foreground='green')

        self.create_widgets()

    def create_widgets(self):
        """ create a widget
        """
        padding = {'padx': 5, 'pady': 5, 'sticky': tk.W}
        # message
        self.message_label = ttk.Label(self)
        self.message_label.grid(column=0, row=0, columnspan=3, **padding)

        # password
        ttk.Label(self, text='New Password:').grid(column=0, row=1, **padding)

        password_entry = ttk.Entry(
            self, textvariable=self.password_var, show='*')
        password_entry.grid(column=1, row=1, **padding)
        password_entry.focus()

        # Confirm password
        ttk.Label(self, text='Confirm Password:').grid(
            column=0, row=2, **padding)

        confirm_password = ttk.Entry(
            self, textvariable=self.confirm_password_var, show='*')
        confirm_password.grid(column=1, row=2, **padding)
        confirm_password.focus()

        # Change button
        submit_button = ttk.Button(self, text='Change')
        submit_button.grid(column=0, row=3, **padding)

    def set_message(self, message, type=None):
        """ set the error or success message
        """
        self.message_label['text'] = message
        if type:
            self.message_label['style'] = type

    def validate(self, *args):
        """ validate the password
        """
        password = self.password_var.get()
        confirm_password = self.confirm_password_var.get()

        if confirm_password == password:
            self.set_message(
                "Success: The new password looks good!", self.SUCCESS)
            return

        if password.startswith(confirm_password):
            self.set_message('Warning: Keep entering the password')


        self.set_message("Error: Passwords don't match!", self.SUCCESS)



if __name__ == "__main__":
    app = App()
    app.mainloop()