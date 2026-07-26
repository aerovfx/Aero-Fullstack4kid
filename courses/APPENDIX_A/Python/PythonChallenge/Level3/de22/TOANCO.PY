# Lập hàm đếm số gà và chó
def solve_chicken_dog(total_legs):
    solutions = [] # Danh sách lưu trữ các giải pháp
    for chicken_count in range(1, total_legs+1): # Duyệt số lượng gà từ 1 đến 101
        for dog_count in range(1, total_legs+1): 
            if 2 * chicken_count + 4 * dog_count == total_legs:
                solutions.append((chicken_count, dog_count))
    return solutions

# Đọc tổng số chân gà và chó từ file
with open("TOANCO.INP", "r") as input_file:
    total_legs = int(input_file.readline())

# Tìm giải pháp gọi hàm đếm số chân và gán cho biến kết quả
results = solve_chicken_dog(total_legs)

# Ghi giải pháp tìm được vào file
with open("TOANCO.OUT","w") as output_file:
    if len(results) > 0:
        output_file.write("Các cặp kết quả phù hợp: \n")
        for chicken_count, dog_count in results:
            output_file.write(f"Số lượng gà: {chicken_count} \n")
            output_file.write(f"Số lượng chó: {dog_count} \n \n")
    else:
        output_file.write("Không tìm thấy giải pháp. \n")