input_file = "b1_SOCHAN.INP"
output_file = "b1_SOCHAN.OUT"

# Đọc dữ liệu từ file SOCHAN.INP
with open(input_file, "r") as file:
    numbers = file.read().strip().split()

even_numbers = []
odd_numbers = []

for num in numbers:
    num = int(num)
    if num % 2 == 0:
        even_numbers.append(str(num))
    else:
        odd_numbers.append(str(num))

result_string = "Các số chẵn: " + ", ".join(even_numbers) + "\n"
result_string += "Các số lẻ: " + ", ".join(odd_numbers) #cộng kết quả số lẽ vào số chẵn

# Ghi kết quả vào file SOCHAN.OUT
with open(output_file, "w") as file:
    file.write(result_string)