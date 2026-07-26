# Tạo hàm sắp xếp các phần tử
def sort_odd_event(numbers):
    odd_numbers = []
    even_numbers = []

    for num in numbers:
        if num % 2 == 0:
            even_numbers.append(num) 
        else:
            odd_numbers.append(num)
    
    odd_numbers.sort() # sắp xếp các phần tử lẻ tăng dần
    even_numbers.sort(reverse=True) # Sắp xếp các phần tử chẵn giảm dần
    sorted_numbers = odd_numbers + even_numbers # Nối các phần tử chẵn và lẻ

    return sorted_numbers

# Nhập dãy số từ người dùng
n = int(input("Hãy nhập số phần tử của dãy số: "))
numbers = []
for i in range(n):
    num = int(input(f"Nhập phần tử thứ {i + 1}: "))
    numbers.append(num)

# Sắp xếp các số
sorted_numbers = sort_odd_event(numbers)

# In kết quả ra màn hình
print("Danh sách các số sau khi sắp xếp: ")
for num in sorted_numbers:
    print(num, end=" ")


