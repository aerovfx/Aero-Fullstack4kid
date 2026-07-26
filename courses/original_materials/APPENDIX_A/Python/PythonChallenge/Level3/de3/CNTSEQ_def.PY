#Khối 1: Hàm đếm chuỗi con
def count_substrings(readline1_split, readline2_split):
    # Xóa các số âm và chuyển đổi thành số dương
    readline2_split = [abs(num) for num in readline2_split]

    # Đếm số chuỗi con có tổng lớn hơn S
    count = 0
    for i in range(len(readline2_split)):
        for j in range(i+1, len(readline2_split)):
            current_sum = readline2_split[i] + readline2_split[j]
            if current_sum > readline1_split[1]:
                count += 1

    return count

#Khối 2: Đọc dữ liệu từ file

def read_data_from_file(file_name):
    with open(file_name, "r") as input_file:
        input_lines = input_file.readlines()

    # Chuyển đổi dữ liệu đọc được thành các list số nguyên
    readline1_split = list(map(int, input_lines[0].split()))
    readline2_split = list(map(int, input_lines[1].split()))

    return readline1_split, readline2_split

#Khối 3: Ghi dữ liệu ra file

def write_data_to_file(file_name, count):
    with open(file_name, "w") as output_file:
        output_file.write(str(count))

def main():
    # Đọc dữ liệu từ file
    readline1_split, readline2_split = read_data_from_file("CNTSEQ.INP")

    # Xử lý chuỗi con và đếm
    count = count_substrings(readline1_split, readline2_split)

    # Ghi kết quả ra file
    write_data_to_file("CNTSEQ.OUT", count)


if __name__ == "__main__":
    main()