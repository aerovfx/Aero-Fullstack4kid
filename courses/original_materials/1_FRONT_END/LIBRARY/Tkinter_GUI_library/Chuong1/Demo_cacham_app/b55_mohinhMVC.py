'''Đây là một ứng dụng đơn giản trong Python sử dụng mô hình thiết kế MVC (Model-View-Controller). 
Mô hình thiết kế MVC được sử dụng để phân tách các thành phần của ứng dụng thành ba phần chính:

Model: đại diện cho dữ liệu của ứng dụng và các logic xử lý dữ liệu. Trong đoạn mã trên, 
lớp Model đại diện cho email và có hai phương thức: email.setter và save để thiết lập và lưu email.
View: đại diện cho giao diện người dùng, nơi người dùng có thể tương tác với ứng dụng. 
Trong đoạn mã trên, lớp View đại diện cho giao diện người dùng bao gồm các thành phần như Label, Entry và Button.
Controller: đại diện cho logic điều khiển của ứng dụng, kết nối giữa Model và View. Trong đoạn mã trên, lớp Controller đại diện cho logic điều khiển của ứng dụng, lấy thông tin từ View, kiểm tra tính hợp lệ của email bằng cách sử dụng Model và sau đó lưu email vào tệp tin. Nếu có lỗi, nó sẽ hiển thị thông báo lỗi trên View.
'''

import re
import tkinter as tk
from tkinter import ttk


class Model:
    def __init__(self, email):
        self.email = email

    @property
    def email(self):
        return self.__email

    @email.setter
    def email(self, value):
        """
        Validate the email
        :param value:
        :return:
        """
        pattern = r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b'
        if re.fullmatch(pattern, value):
            self.__email = value
        else:
            raise ValueError(f'Invalid email address: {value}')

    def save(self):
        """
        Save the email into a file
        :return:
        """
        with open('emails.txt', 'a') as f:
            f.write(self.email + '\n')

'''Define the View class

class View(ttk.Frame):
def init(self, parent):
super().init(parent
'''
class View(ttk.Frame):
    def __init__(self, parent):
        super().__init__(parent)

        # create widgets
        # label
        self.label = ttk.Label(self, text='Email:')
        self.label.grid(row=1, column=0)

        # email entry
        self.email_var = tk.StringVar()
        self.email_entry = ttk.Entry(self, textvariable=self.email_var, width=30)
        self.email_entry.grid(row=1, column=1, sticky=tk.NSEW)

        # save button
        self.save_button = ttk.Button(self, text='Save', command=self.save_button_clicked)
        self.save_button.grid(row=1, column=3, padx=10)

        # message
        self.message_label = ttk.Label(self, text='', foreground='red')
        self.message_label.grid(row=2, column=1, sticky=tk.W)

        # set the controller
        self.controller = None

    def set_controller(self, controller):
        """
        Set the controller
        :param controller:
        :return:
        """
        self.controller = controller

    def save_button_clicked(self):
        """
        Handle button click event
        :return:
        """
        if self.controller:
            self.controller.save(self.email_var.get())

    def show_error(self, message):
        """
        Show an error message
        :param message:
        :return:
        """
        self.message_label['text'] = message
        self.message_label['foreground'] = 'red'
        self.message_label.after(3000, self.hide_message)
        self.email_entry['foreground'] = 'red'

    def show_success(self, message):
        """
        Show a success message
        :param message:
        :return:
        """
        self.message_label['text'] = message
        self.message_label['foreground'] = 'green'
        self.message_label.after(3000, self.hide_message)

        # reset the form
        self.email_entry['foreground'] = 'black'
        self.email_var.set('')

    def hide_message(self):
        """
        Hide the message
        :return:
        """
        self.message_label['text'] = ''            


class Controller:
    def __init__(self, model, view):
        self.model = model
        self.view = view

    def save(self, email):
        """
        Save the email
        :param email:
        :return:
        """
        try:

            # save the model
            self.model.email = email
            self.model.save()

            # show a success message
            self.view.show_success(f'The email {email} saved!')

        except ValueError as error:
            # show an error message
            self.view.show_error(error)        

class App(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title('Tkinter MVC Demo')

        # create a model
        model = Model('hello@pythontutorial.net')

        # create a view and place it on the root window
        view = View(self)
        view.grid(row=0, column=0, padx=10, pady=10)

        # create a controller
        controller = Controller(model, view)

        # set the controller to view
        view.set_controller(controller)


if __name__ == '__main__':
    app = App()
    app.mainloop()            