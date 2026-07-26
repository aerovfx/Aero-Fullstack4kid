sequence = input("Nhập vào dãy ký tự: ")

numbers = []
letters = []

for char in sequence:
    if char.isdigit():
        numbers.append(char)
    else:
        letters.append(char)
numbers.sort(reverse=True)
letters.sort()

print("Nữa đầu giảm dần", numbers)
print("Nữa sau tăng dần", letters)