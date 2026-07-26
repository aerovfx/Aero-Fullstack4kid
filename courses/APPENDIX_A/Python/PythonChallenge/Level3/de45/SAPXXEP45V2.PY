n = int(input('nhập vào số phần tử: '))
danh_sach = list(map(int, input('nhập các phàn tử, các số cách nhau dấu cách: ').split()))
k = int(input('nhập vào số nguyên k:'))

danh_sach.sort(reverse=True)

for i in range(len(danh_sach)):
    inserted = False
    if k >= danh_sach[i]:
        danh_sach.insert(i, k)
        inserted = True
        break # Thoát khi chèn xong
# if not inserted:
#     danh_sach.append(k)


# In dãy số đã xếp lại giảm dần và chèn thêm số nguyên K
print("Dãy số đã xếp lại giảm dần và chèn thêm số nguyên K:")
print(" ".join(map(str, danh_sach)))

# # Chèn số nguyên K vào dãy số sao cho thứ tự giảm dần được duy trì
# inserted = False
# for i in range(len(numbers)):
# if K >= numbers[i]:
#     numbers.insert(i, K)
#     inserted = True
#     break

# if not inserted:
# numbers.append(K)

# # In dãy số đã xếp lại giảm dần
# print("Dãy số đã xếp lại giảm dần:")
# print(" ".join(map(str, numbers)))

# # In dãy số đã xếp lại giảm dần và chèn thêm số nguyên K
# print("Dãy số đã xếp lại giảm dần và chèn thêm số nguyên K:")
# print(" ".join(map(str, numbers)))
