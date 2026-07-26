# Hàm tính số lần xoay cần thiết để các bạn học sinh cùng nhìn về hướng target_direction
def calculate_rotation_count(directions, target_direction):
    rotation_count = 0

    for direction in directions:
        if direction == target_direction:
            continue
        elif direction == 1:  # Nhìn về trước
            if target_direction == 2:  # Nếu muốn nhìn về phía sau
                rotation_count += 2
            else:
                rotation_count += 1
        elif direction == 2:  # Nhìn về phía sau
            if target_direction == 1:  # Nếu muốn nhìn về trước
                rotation_count += 2
            else:
                rotation_count += 1
        elif direction == 3:  # Nhìn sang trái
            if target_direction == 4:  # Nếu muốn nhìn sang phải
                rotation_count += 2
            else:
                rotation_count += 1
        elif direction == 4:  # Nhìn sang phải
            if target_direction == 3:  # Nếu muốn nhìn sang trái
                rotation_count += 2
            else:
                rotation_count += 1
    
    return rotation_count

def main():
    # Đọc dữ liệu từ tập tin input
    with open("DOIHUONGV2.INP", "r") as input_file:
        test_cases = input_file.read().splitlines()

    output_lines = []

    for test_case in test_cases:
        directions = list(map(int, test_case))
        min_rotation_count = float('inf')
        best_directions = []

        # Duyệt qua tất cả các hướng có thể chọn
        for target_direction in range(1, 5):
            rotation_count = calculate_rotation_count(directions, target_direction)
            if rotation_count < min_rotation_count:
                min_rotation_count = rotation_count
                best_directions = [target_direction]
            elif rotation_count == min_rotation_count:
                best_directions.append(target_direction)

        # Ghi kết quả vào danh sách đầu ra
        output_lines.append(" ".join(map(str, best_directions)))
        output_lines.append(str(min_rotation_count))

    # Ghi kết quả từ danh sách đầu ra vào tập tin output
    with open("DOIHUONG.OUT", "w") as output_file:
        output_file.write("\n".join(output_lines))

if __name__ == "__main__":
    main()
