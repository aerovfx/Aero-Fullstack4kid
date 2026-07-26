def count_max_height_friends(heights):
    height_count = {}  # Tạo một từ điển để đếm số lần xuất hiện của từng chiều cao

    for height in heights:
        if height in height_count:
            height_count[height] += 1
        else:
            height_count[height] = 1

    max_height = max(height_count, key=height_count.get)  # Chiều cao xuất hiện nhiều nhất
    max_count = height_count[max_height]  # Số lần xuất hiện của chiều cao đó

    return max_height, max_count


def main():
    # Đọc dữ liệu từ file XEPHANG.INP
    with open('XEPHANG.INP', 'r') as file_in:
        n = int(file_in.readline().strip())
        heights = list(map(int, file_in.readline().strip().split()))

    # Đếm số bạn có chiều cao bằng nhau nhiều nhất
    max_height, max_count = count_max_height_friends(heights)

    # Ghi kết quả vào file XEPHANG.OUT
    with open('XEPHANG.OUT', 'w') as file_out:
        while max_count > 0:
            file_out.write(f"{max_count} {max_height}\n")
            heights = [h for h in heights if h != max_height]  # Loại bỏ các bạn đã đếm
            max_height, max_count = count_max_height_friends(heights)


if __name__ == "__main__":
    main()
