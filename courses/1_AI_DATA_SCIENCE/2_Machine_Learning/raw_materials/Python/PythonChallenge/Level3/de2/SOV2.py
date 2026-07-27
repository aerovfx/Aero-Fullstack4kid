def count_geometric_sequences(n, q, a):
    result = []  # Danh sách kết quả số dãy con cấp số nhân công bội với q

    for k in range(2, n + 1):
        count = 0  # Biến đếm số lượng dãy con cấp số nhân công bội với q
        for i in range(n - k + 1):
            subsequence = a[i:i+k]  # Lấy dãy con từ a[i] đến a[i+k-1]
            is_geometric = True  # Biến kiểm tra dãy con có phải là cấp số nhân công bội không

            for j in range(1, k):
                if subsequence[j] % subsequence[j - 1] != 0 or subsequence[j] / subsequence[j - 1] != q:
                    is_geometric = False
                    break

            if is_geometric:
                count += 1

        result.append(count)

    return result


# Đọc dữ liệu từ file INPUT
with open('SO.INP', 'r') as f:
    # Đọc dòng đầu tiên chứa n và q
    n, q = map(int, f.readline().split())

    # Đọc dòng thứ hai chứa dãy a
    a = list(map(int, f.readline().split()))

# Gọi hàm để tính kết quả
res = count_geometric_sequences(n, q, a)

# Ghi kết quả vào file OUTPUT
with open('SO.OUT', 'w') as f:
    f.write(' '.join(map(str, res)))