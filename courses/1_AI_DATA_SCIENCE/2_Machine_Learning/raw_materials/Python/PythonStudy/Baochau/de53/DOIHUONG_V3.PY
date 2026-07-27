file = open('DOIHUONG.INP')
file1 = open('DOIHUONG.OUT', 'w')

result = []
for test in range(10):
    n = file.readline().strip()  # Đọc dãy số và loại bỏ ký tự newline

    n1 = list(map(int, n))  # Chuyển dãy số thành danh sách các số nguyên

    for i in range(len(n1)):
        if n1[i] == 2:
            n1[i] = 3
        elif n1[i] == 3:
            n1[i] = 2

    best_directions = []
    min_rotation_count = float('inf')

    # Tính số lần xoay với từng hướng từ 1-4:
    for huong in range(1, 5):
        dem = 0
        for i in range(len(n1)):
            temp = abs(huong - n1[i])  # Sửa lỗi n[i] thành n1[i]
            if temp > 2:
                temp = 1
            dem += temp

        if huong == 1:
            tong = dem
            best_directions.append(huong)
        elif tong > dem:
            tong = dem
            best_directions = [huong]
        elif tong == dem:
            best_directions.append(huong)

    # Đổi hướng xoay 2 thành 3, 3 thành 2:
    for i in range(len(best_directions)):
        if best_directions[i] == 2:
            best_directions[i] = 3
        elif best_directions[i] == 3:
            best_directions[i] = 2

    temp = ''.join(map(str, best_directions))
    if test < 9:
        file1.write(temp + '\n' + str(tong) + '\n')
    else:
        file1.write(temp + '\n' + str(tong))

file.close()
file1.close()