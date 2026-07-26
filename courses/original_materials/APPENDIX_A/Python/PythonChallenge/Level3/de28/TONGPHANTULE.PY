# Nhập số phần tử trong dãy
N = int(input("Nhập số phần tử trong dãy: "))

# Khởi tạo biến tổng lẻ
tong_le = 0

# Nhập vào dãy số và tính tổng lẻ
for i in range(N):
    num = int(input("Nhập số thứ {}: ". format(i + 1)))
    if num % 2 != 0:
        tong_le += num

# In ra kết quả tổng các số lẻ
print("Tổng các số lẻ trong dãy là: ", tong_le)