def cycle_length(n):
    count = 1
    while n != 1:
        if n % 2 == 0:
            n = n // 2
        else:
            n = 3 * n + 1
        count += 1
    return count

# Đọc dữ liệu từ file vào
with open("ONLINEJUGDE100.INP", "r") as input_file:
    lines = input_file.readlines()

# Mở file để ghi kết quả
with open("ONLINEJUGDE100.OUT", "w") as output_file:
    # Xử lý từng cặp số nguyên đầu vào
    for line in lines:
        i, j = map(int, line.strip().split())
        max_cycle_length = 0

        # Hoán đổi i và j nếu i lớn hơn j
        if i > j:
            i, j = j, i

        # Tìm chiều dài chu kỳ tối đa trong khoảng
        for num in range(i, j + 1):
            cycle_len = cycle_length(num)
            max_cycle_length = max(max_cycle_length, cycle_len)

        # Ghi kết quả vào file
        output_file.write(f"{i} {j} {max_cycle_length}\n")
