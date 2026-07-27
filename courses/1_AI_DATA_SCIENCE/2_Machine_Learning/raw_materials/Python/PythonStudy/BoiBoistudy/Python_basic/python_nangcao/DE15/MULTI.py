#Hàm
def multi(x,y):
    multi = int(x)*int(y)
    return multi
    
#Dữ liệu đầu vào file MULTI.INP
with open("MULTI.INP", "r") as file:
    lines = file.readlines()

results = []
for line in lines:
    mul_list = line.strip().split(" ")
    x,y = map(int, mul_list)  # Chuyển đổi thành số nguyên

    result = multi(x,y)
    results.append(result)

# Xuất kết quả vào file OUTPUT
with open("MULTI.OUT", "w") as file:
    for result in results:
        file.write(f"{result}\n")