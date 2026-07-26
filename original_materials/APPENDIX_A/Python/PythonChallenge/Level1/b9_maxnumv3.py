def max_of_three(a, b, c):
    if a > b:
        if a > c:
            return a
        else:
            return c
    else:
        if b > c:
            return b
        else:
            return c

# Đọc dữ liệu từ file INPUT
with open("b9_MAXNUM.INP", "r") as file:
    a_list = file.read().strip().split(",")

a, b, c = a_list



# Xuất kết quả vào file OUTPUT
with open("b9_MAXNUM.OUT", "w") as file:  # Mở file "b4_DICT.OUT" trong chế độ ghi
    result = max_of_three(a,b,c)   
    file.write(f"{result}\n")  # Ghi dòng kết quả vào file với định dạng "n thì đầu ra result"


    