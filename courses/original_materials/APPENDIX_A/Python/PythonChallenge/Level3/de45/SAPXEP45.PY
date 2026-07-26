N = int(input("Nhập số phần tử của dãy: "))
numbers = list(map(int, input("Nhập dãy số, các số cách nhau bằng khoảng trắng: ").split()))
K = int(input("Nhập số nguyên K: "))

# Xếp lại dãy số theo thứ tự giảm dần
numbers.sort(reverse=True)

# Chèn số nguyên K vào dãy số sao cho thứ tự giảm dần được duy trì
inserted = False
for i in range(len(numbers)):
    if K >= numbers[i]:
        numbers.insert(i, K)
        inserted = True
        break

if not inserted:
    numbers.append(K)


# In dãy số đã xếp lại giảm dần và chèn thêm số nguyên K
print("Dãy số đã xếp lại giảm dần và chèn thêm số nguyên K:")
print(" ".join(map(str, numbers)))
