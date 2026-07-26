
# Đọc dữ liệu từ file "DAYSO.INP"
with open('BAI10.INP', 'r') as file:
    danh_sach = list(map(int, file.readline().split(",")))

# In ra kết quả
n=int(input('Nhập phần tử thứ:'))
print(danh_sach[n-1])