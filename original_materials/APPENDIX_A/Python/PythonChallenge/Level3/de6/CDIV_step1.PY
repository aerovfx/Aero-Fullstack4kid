# Dữ liệu đầu vào
n = 6
arr = [12, 5, 6, 4, 7, 10]

# Tìm các cặp số
pairs = []
for i in range(n):
    for j in range(i+1, n):
        pairs.append((arr[i], arr[j]))

# In kết quả
for pair in pairs:
    print(pair)
