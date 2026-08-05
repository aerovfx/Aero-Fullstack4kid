# 11_buffer_demo.py

MAX_SIZE = 64

user_input = input("Nhập dữ liệu: ")

if len(user_input) > MAX_SIZE:
    print("Buffer Overflow có thể xảy ra!")
else:
    print("Dữ liệu hợp lệ.")
