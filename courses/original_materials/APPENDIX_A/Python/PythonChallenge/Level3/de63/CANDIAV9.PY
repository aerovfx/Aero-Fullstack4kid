def count_ways(n, weights):
    weights.sort()  # Sắp xếp các quả cân theo thứ tự tăng dần
    count = 0

    def recursive_count(index, left_sum, right_sum):
        nonlocal count
        if index == n:
            if left_sum <= right_sum:
                count += 1
            return

        # Đặt quả cân ở đĩa trái và đệ quy
        recursive_count(index + 1, left_sum + weights[index], right_sum)

        # Đặt quả cân ở đĩa phải và đệ quy
        recursive_count(index + 1, left_sum, right_sum + weights[index])

    recursive_count(0, 0, 0)
    return count

# Đọc dữ liệu từ input
n = int(input())
weights = list(map(int, input().split()))

# Tính và in ra kết quả
result = count_ways(n, weights)
print(result)
