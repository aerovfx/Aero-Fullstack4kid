#Đọc dữ liệu vào file LISTSUM.INP
with open("LISTSUM.INP","r") as file:
    numbers = file.readlines()

#Xử lý từng dòng trong danh sách
num = []
for line in numbers:
    sum_list = line.strip().split(" ")
    sums = sum(map(int,sum_list))
    num.append(sums)

# Kết quả ghi ra file LISTSUM.OUT
with open("LISTSUM.OUT","w") as file:
    for sums in num:
        file.write(f"{sums}\n")