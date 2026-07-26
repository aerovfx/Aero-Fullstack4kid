def max(a, b):
    if a > b:
        return a
    else:
            return b
    

# Đọc dữ liệu từ file INPUT
with open("SOSANH.INP", "r") as file:
    max_list = file.read().strip().split(" ")

a, b = max_list

# Xuất kết quả vào file OUTPUT
with open("SOSANH.OUT", "w") as file:  
    result = max(a,b)   
    file.write(f"{result}\n")  # Ghi dòng kết quả vào file với định dạng "n thì đầu ra result"


    