'''
tkinter: Thư viện giao diện người dùng của Python, hỗ trợ tạo ra các thành phần giao diện như cửa sổ, nút bấm, hộp văn bản, v.v.
ttk: Thư viện được xây dựng trên cơ sở của tkinter, cung cấp các widget giao diện người dùng trông hiện đại hơn so với tkinter.
showerror: Hàm dùng để hiển thị thông báo lỗi.
Thread: Thư viện dùng để tạo luồng (thread) trong Python, giúp xử lý các tác vụ đồng thời.
'''

import tkinter as tk
from tkinter import ttk
from tkinter.messagebox import showerror
from threading import Thread
import requests
#pip install requests, cài module này trước khi chạy chương trình nhé.

'''AsyncDownload kế thừa từ lớp Thread.
Phương thức khởi tạo (__init__) của AsyncDownload 
chấp nhận một tham số url là đường dẫn của trang web cần tải về. 
Trong phương thức khởi tạo, biến html được thiết lập là None, và biến url được gán bằng giá trị url.
Phương thức run sẽ được thực thi khi AsyncDownload được khởi động bằng phương thức start. 
Trong phương thức này, trang web được tải về bằng thư viện requests, sau đó nội dung của trang được gán cho biến html
'''

class AsyncDownload(Thread):
    def __init__(self, url):
        super().__init__()

        self.html = None
        self.url = url

    def run(self):
        response = requests.get(self.url)
        self.html = response.text



'''App kế thừa từ tk.Tk, là lớp cơ sở của thư viện tkinter.
Phương thức khởi tạo của App thiết lập các thuộc tính của cửa sổ chương trình 
(title, geometry, resizable), sau đó gọi các phương thức create_header_frame, create_body_frame, và create_footer_frame 
'''
class App(tk.Tk):
    def __init__(self):
        super().__init__()

        self.title('Webpage Download')
        self.geometry('680x430')
        self.resizable(0, 0)

        self.create_header_frame()
        self.create_body_frame()
        self.create_footer_frame()

    def create_header_frame(self):

        self.header = ttk.Frame(self)
        # configure the grid
        self.header.columnconfigure(0, weight=1)
        self.header.columnconfigure(1, weight=10)
        self.header.columnconfigure(2, weight=1)
        # label
        self.label = ttk.Label(self.header, text='URL')
        self.label.grid(column=0, row=0, sticky=tk.W)

        # entry
        self.url_var = tk.StringVar()
        self.url_entry = ttk.Entry(self.header,
                                   textvariable=self.url_var,
                                   width=80)

        self.url_entry.grid(column=1, row=0, sticky=tk.EW)

        # download button
        self.download_button = ttk.Button(self.header, text='Download')
        self.download_button['command'] = self.handle_download
        self.download_button.grid(column=2, row=0, sticky=tk.E)

        # attach the header frame
        self.header.grid(column=0, row=0, sticky=tk.NSEW, padx=10, pady=10)

    def handle_download(self):
        url = self.url_var.get()
        if url:
            self.download_button['state'] = tk.DISABLED
            self.html.delete(1.0, "end")

            download_thread = AsyncDownload(url)
            download_thread.start()

            self.monitor(download_thread)
        else:
            showerror(title='Error',
                      message='Please enter the URL of the webpage.')

    def monitor(self, thread):
        if thread.is_alive():
            # check the thread every 100ms
            self.after(100, lambda: self.monitor(thread))
        else:
            self.html.insert(1.0, thread.html)
            self.download_button['state'] = tk.NORMAL

    def create_body_frame(self):
        self.body = ttk.Frame(self)
        # text and scrollbar
        self.html = tk.Text(self.body, height=20)
        self.html.grid(column=0, row=1)

        scrollbar = ttk.Scrollbar(self.body,
                                  orient='vertical',
                                  command=self.html.yview)

        scrollbar.grid(column=1, row=1, sticky=tk.NS)
        self.html['yscrollcommand'] = scrollbar.set

        # attach the body frame
        self.body.grid(column=0, row=1, sticky=tk.NSEW, padx=10, pady=10)

    def create_footer_frame(self):
        self.footer = ttk.Frame(self)
        # configure the grid
        self.footer.columnconfigure(0, weight=1)
        # exit button
        self.exit_button = ttk.Button(self.footer,
                                      text='Exit',
                                      command=self.destroy)

        self.exit_button.grid(column=0, row=0, sticky=tk.E)

        # attach the footer frame
        self.footer.grid(column=0, row=2, sticky=tk.NSEW, padx=10, pady=10)


if __name__ == "__main__":
    app = App()
    app.mainloop()