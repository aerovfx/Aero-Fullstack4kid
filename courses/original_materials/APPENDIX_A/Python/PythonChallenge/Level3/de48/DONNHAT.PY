def is_unique_sequence(sequence):
    # Sử dụng tập hợp để kiểm tra tính duy nhất của các phần tử trong dãy
    return len(set(sequence)) == len(sequence)

def main():
    # Đọc dữ liệu từ tệp DONNHAT.INP
    try:
        with open('DONNHAT.INP', 'r') as input_file:
            N = int(input_file.readline())
            A = list(map(int, input_file.readline().split()))
    except FileNotFoundError:
        print("Không tìm thấy tệp DONNHAT.INP")
        return

    # Kiểm tra dãy số A có phải là dãy đơn nhất hay không
    is_unique = is_unique_sequence(A)

    # Ghi kết quả vào tệp DONNHAT.OUT
    try:
        with open('DONNHAT.OUT', 'w') as output_file:
            output_file.write(str(int(is_unique)))
    except FileNotFoundError:
        print("Không thể ghi kết quả vào tệp DONNHAT.OUT")
if __name__ == "__main__":
    main()
