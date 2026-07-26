# Hàm tính min, max và trung bình
def mma_num(numbers):
    # Kiểm tra nếu danh sách số trống
    if not numbers:
        return None, None, None
    
    # Khởi tạo giá trị nhỏ nhất, lớn nhất và tổng
    min_value = numbers[0]
    max_value = numbers[0]
    total = 0
    for num in numbers:
        # Tìm giá trị nhỏ nhất và lớn nhất
        if num < min_value:
            min_value = num
        if num > max_value:
            max_value = num

        # cộng giá trị vào tổng
        total += num
    # tính giá trị trung bình
    average = total/len(numbers)
    return min_value, max_value, average
# Đọc dữ liệu từ file
with open("DAYSO.INP", "r") as file_input:
    lines = file_input.readlines()

#Ghi dữ liệu vào file
with open("DAYSO.OUT","w") as file_output:
    for line in lines:
        numbers = [int(num) for num in line.split()]

        # TÍnh giấ trị min, max, average
        min_value, max_value, average = mma_num(numbers)
        # Ghi kết quả ra file
        file_output.write(f"{min_value} {max_value} {average} \n")
