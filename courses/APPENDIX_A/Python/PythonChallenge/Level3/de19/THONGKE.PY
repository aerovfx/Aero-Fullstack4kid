# Ham dem so xuat hien trong chuoi
def count_frequency(numbers):
    frequency = {}
    for num in numbers:
        if num in frequency:
            frequency[num] += 1
        else:
            frequency[num] = 1
    return frequency

# Doc du lieu tu file ben ngoai
def read_input_file():
    with open("THONGKE.INP", "r") as file_input:
        lines = file_input.readlines()
        numbers_list = [line.strip().split() for line in lines]
    return numbers_list

# Ham ghi du lieu ra file
def write_output_file(frequencies):
    with open("THONGKE.OUT", "w") as file_output:
        for freq in frequencies:
            for num, count in freq.items():
                file_output.write(f"{num}({count}) ")
            file_output.write("\n")

# Chuong trinh chinh
def main():
    numbers_list = read_input_file()
    frequencies = []
    for numbers in numbers_list:
        frequency = count_frequency(numbers)
        frequencies.append(frequency)
    write_output_file(frequencies)

main()
