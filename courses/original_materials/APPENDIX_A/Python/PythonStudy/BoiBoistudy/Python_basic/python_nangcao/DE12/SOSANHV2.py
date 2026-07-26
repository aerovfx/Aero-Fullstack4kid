# Hàm tìm số lớn nhất trong cặp
def max(a,b):
    if a>b:return a
    if b>a:return b
# Đọc file
with open('SOSANH.INP', 'r') as file:
    lines  = file.readlines()
# Xử lý từng dòng trong danh sách lines
results = []
for line in lines:
    max_list = line.strip().split(" ")
    a, b = map(int, max_list)
    
    result = max(a,b)
    results.append(result)
# In dữ liệu
with open('SOSANH.OUT', 'w') as file:
    for result in results:
        file.write(f"{result}\n")   
    
