MOD = 10**9 + 7

def count_geometric_subsequences(n, q, a):
    counts = [0] * (n - 1)  # Khởi tạo một danh sách chứa số dãy con có độ dài từ 2 đến n của dãy a, ban đầu các số đếm đều là 0
    
    for i in range(n - 1):
        current_count = 0  # Số dãy con đạt yêu cầu với độ dài (i+2) ban đầu là 0
        current_val = a[i]  # Giá trị hiện tại được sử dụng để kiểm tra tính công bội
        
        for j in range(i + 1, n):  # Duyệt qua các phần tử từ i+1 đến n-1
            if a[j] % current_val == 0:  # Nếu phần tử thỏa mãn tính công bội
                current_count += 1  # Tăng số dãy con đạt yêu cầu lên 1
                current_val *= q  # Cập nhật giá trị hiện tại lên bội số tiếp theo
                current_val %= MOD  # Chia dư cho MOD để tránh số quá lớn
        
        counts[i] = current_count % MOD  # Gán số dãy con đạt yêu cầu với độ dài (i+2) vào danh sách counts
    
    return counts

# Đọc dữ liệu từ file input
with open('SO.INP', 'r') as file:
    n, q = map(int, file.readline().split())  # Đọc số phần tử n và giá trị q
    a = list(map(int, file.readline().split()))  # Đọc dãy số nguyên a

# Tính số dãy con theo yêu cầu
result = count_geometric_subsequences(n, q, a)

# Ghi kết quả vào file output
with open('SO.OUT', 'w') as file:
    file.write(' '.join(str(x) for x in result))  # Ghi danh sách kết quả vào file output, cách nhau bởi dấu cách
