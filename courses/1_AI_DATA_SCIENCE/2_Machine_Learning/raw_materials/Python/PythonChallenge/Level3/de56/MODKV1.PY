# Đọc dữ liệu từ file MODK.INP
with open('MODK.INP', 'r') as f:
    N, K = map(int, f.readline().split())

# Tạo danh sách ban đầu từ dãy số tự nhiên từ 1 đến N
initial_sequence = list(range(1, N + 1))

# Khởi tạo danh sách sắp xếp cuối cùng
sorted_sequence = []

# Lặp qua từng phần tử trong khoảng từ 0 đến K - 1
for i in range(K):
    # Tạo danh sách các số thỏa mãn điều kiện chia K dư i
    # numbers_with_mod_i = [x for x in initial_sequence if x % K == i]
    numbers_with_mod_i = []
    for x in initial_sequence:
        if x % K == i:
            numbers_with_mod_i.append(x)
    # Sắp xếp danh sách này theo chiều tăng dần và thêm vào danh sách sắp xếp cuối cùng
    sorted_sequence.extend(sorted(numbers_with_mod_i))

# Ghi kết quả vào file MODK.OUT
with open('MODK.OUT', 'w') as f:
    # Chuyển đổi danh sách thành chuỗi và ghi vào file, cách nhau bởi dấu phẩy và khoảng trắng
    f.write(', '.join(map(str, sorted_sequence)))
