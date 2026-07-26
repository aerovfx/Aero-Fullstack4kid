# Hàm tính số lần xoay cần thiết để các bạn học sinh cùng nhìn về hướng target_direction
def calculate_rotation_count(huongs, huong_muctieu):
    value = 0

    for huong in huongs:
        if huong == huong_muctieu:
            continue
        elif huong == 1:  # Nhìn về trước
            if huong_muctieu == 2:  # Nếu muốn nhìn về phía sau
                value += 2
            else:
                value += 1
        elif huong == 2:  # Nhìn về phía sau
            if huong_muctieu == 1:  # Nếu muốn nhìn về trước
                value += 2
            else:
                huong_muctieu += 1
        elif huong == 3:  # Nhìn sang trái
            if huong_muctieu == 4:  # Nếu muốn nhìn sang phải
                value += 2
            else:
                value += 1
        elif huong == 4:  # Nhìn sang phải
            if huong_muctieu == 3:  # Nếu muốn nhìn sang trái
                value += 2
            else:
                value += 1
        return value

def main():
    # Đọc dữ liệu từ tập tin input
    with open("DOIHUONG.INP", "r") as file:
        tests = file.read().splitlines()

    output = []

    for test in tests:
        huongs = list(map(int, test))
        vongquay_min = float('inf')
        best = []

        # Duyệt qua tất cả các hướng có thể chọn
        for huong_muctieu in range(1, 5):
            value = calculate_rotation_count(huongs, huong_muctieu)
            if value < vongquay_min:
                vongquay_min = value
                best = [huong_muctieu]
            elif value == vongquay_min:
                best.append(huong_muctieu)

        # Ghi kết quả vào danh sách đầu ra
        output.append(" ".join(map(str, best)))
        output.append(str(vongquay_min))

    # Ghi kết quả từ danh sách đầu ra vào tập tin output
    with open("DOIHUONG.OUT", "w") as file:
        file.write("\n".join(output))

if __name__ == "__main__":
    main()