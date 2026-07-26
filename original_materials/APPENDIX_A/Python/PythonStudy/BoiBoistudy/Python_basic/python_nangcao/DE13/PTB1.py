#Hàm giải pt bậc 1:
def ptb1(a, b):
    if a==0:
        return "pt nay vo nghiem"
    else:
        return int(-b)/int(a)
    
# Đọc dữ liệu từ file INPUT
with open("PTB1.INP", "r") as file:
    lines = file.readlines()
# Xử lý từng dòng trong danh sách lines
results = []
for line in lines:
    ab_list = line.strip().split(" ")
    a, b = map(int, ab_list)  # Chuyển đổi thành số nguyên

    result = ptb1(a, b)
    results.append(result)

# Xuất kết quả vào file OUTPUT
with open("PTB1.OUT", "w") as file:
    for result in results:
        file.write(f"{result}\n")