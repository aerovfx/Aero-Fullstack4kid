def count_positive_numbers_and_sum(numbers):
    count = 0
    sum = 0
    for number in numbers:
        if number > 0:
            count += 1
            sum += number
    return count, sum
# Sử dụng hàm trên với một danh sách các số nguyên bất kỳ
numbers = [1, 2, 3, -4, -5, 6, 7, -8, 9]
count, sum = count_positive_numbers_and_sum(numbers)
print("Số lượng các số hạng dương là:", count)
print("Tổng các số hạng dương là:", sum)