numbers = input("Nhập danh sách các số, cách nhau bằng dấu phẩy: ")
numbers = numbers.split(",")  # Tách danh sách thành các số

even_numbers = [] #gan mang so chan la danh sach rong
odd_numbers = [] #gan so le la danh sach rong

for num in numbers:  #lap chay tu phan tu dau den cuoi cua mang co ten la "numbers"
    num = int(num)
    if num % 2 == 0:
        even_numbers.append(str(num))
    else:
        odd_numbers.append(str(num))

print("Các số chẵn: "+", ".join(even_numbers))
print("Các số lẻ: " + ", ".join(odd_numbers))
