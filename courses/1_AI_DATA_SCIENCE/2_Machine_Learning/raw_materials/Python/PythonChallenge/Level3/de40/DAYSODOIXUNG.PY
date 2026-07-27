# Đọc giá trị n từ bàn phím là số lượng phần tử của dãy số A
n = int(input("Nhập số lượng phần tử của dãy số A: "))

# Đọc n phần tử của dãy số A từ bàn phím
A = list(map(int, input("Nhập dãy số A, các phần tử cách nhau bằng dấu cách: ").split()))

# Tạo bảng DP kích thước nxn
DP = [[0] * n for _ in range(n)]

# Khởi tạo DP[i][i] = 1 cho mọi i từ 0 đến n-1
for i in range(n):
    DP[i][i] = 1

# Khởi tạo biến max_len là độ dài của dãy số con đối xứng dài nhất tìm được
max_len = 1

# Khởi tạo biến start và end để lưu vị trí bắt đầu và kết thúc của dãy số con đối xứng dài nhất
start = 0
end = 0

# Duyệt i từ n-1 đến 0 và j từ i+1 đến n-1
for i in range(n - 1, -1, -1):
    for j in range(i + 1, n):
        if A[i] == A[j] and j - i + 1 > DP[i + 1][j - 1]:
            DP[i][j] = DP[i + 1][j - 1] + 2
            if DP[i][j] > max_len:
                max_len = DP[i][j]
                start = i
                end = j

# In dãy số con đối xứng dài nhất từ start đến end trong dãy A
print("Dãy số con đối xứng dài nhất của dãy A là:", A[start:end+1])
