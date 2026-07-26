import random # Import thư viện random để sử dụng các hàm liên quan đến số ngẫu nhiên.

def is_valid(matrix, row, col, num): # Định nghĩa hàm is_valid để kiểm tra tính hợp lệ của một giá trị num tại vị trí (row, col) trong ma trận.
    if matrix[row][col] != 0:
        return False

    for i in range(4):
        if i != col and matrix[row][i] == num:
            return False

    for i in range(6):
        if i != row and matrix[i][col] == num:
            return False

    for i in range(min(row, col) + 1):
        if matrix[row - i][col - i] == num:
            return False

    for i in range(min(row, 3 - col) + 1):
        if matrix[row - i][col + i] == num:
            return False

    return True

def generate_matrix(numbers):
    matrix = [[0] * 4 for _ in range(6)]
    random.shuffle(numbers)

    while True:
        random.shuffle(numbers)
        submatrix = [numbers[i:i+4] for i in range(0, 24, 4)]
        valid = True
        for row in submatrix:
            if set(row) == {1, 2, 3, 4}:
                valid = False
                break
        if valid:
            break

    idx = 0
    for row in range(6):
        for col in range(4):
            if matrix[row][col] == 0:
                matrix[row][col] = numbers[idx]
                idx += 1

    return matrix

def read_numbers_from_file(filename):
    with open(filename, 'r') as file:
        lines = file.readlines()
        numbers = []
        for line in lines:
            numbers.extend(list(map(int, line.strip().split())))
        return numbers

def write_matrix_to_file(matrix, filename):
    with open(filename, 'w') as file:
        for row in matrix:
            file.write(' '.join(map(str, row)) + '\n')

def main():
    numbers = read_numbers_from_file('SIT.INP')
    if len(numbers) != 24:
        print("Số lượng số trong file 'SIT.INP' không đúng!")
        return

    # Thực hiện nhiều lần để tìm ma trận hợp lệ
    while True:
        matrix = generate_matrix(numbers)
        invalid = False

        # Kiểm tra các phần tử 1, 2, 3, 4 không nằm gần nhau
        for row in range(6):
            for col in range(4):
                if matrix[row][col] in {1, 2, 3, 4}:
                    if (row > 0 and matrix[row-1][col] in {1, 2, 3, 4}) or \
                       (row < 5 and matrix[row+1][col] in {1, 2, 3, 4}) or \
                       (col > 0 and matrix[row][col-1] in {1, 2, 3, 4}) or \
                       (col < 3 and matrix[row][col+1] in {1, 2, 3, 4}):
                        invalid = True
                        break
            if invalid:
                break

        if not invalid:
            break

    write_matrix_to_file(matrix, 'SIT.OUT')
    print("Đã tạo ma trận hợp lệ và ghi vào file 'SIT.OUT'!")

if __name__ == '__main__':
    main()

