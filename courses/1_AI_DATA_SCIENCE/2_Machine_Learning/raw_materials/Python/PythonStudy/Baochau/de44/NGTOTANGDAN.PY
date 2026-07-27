def tim_songto(n):
    if n <= 1:
        return False  # Nếu số nhỏ hơn hoặc bằng 1, không phải số nguyên tố
    for i in range(2, int(n ** 0.5) + 1):
        if n % i == 0:
            return False  # Nếu có số nào trong khoảng từ 2 đến căn bậc hai của n chia hết cho n, không phải số nguyên tố
    return True  # Nếu không có số nào trong khoảng từ 2 đến căn bậc hai của n chia hết cho n, là số nguyên tố
n = int(input('nhập vào số phần tử của mảng n: '))
array = []

for i in range(n):
    num = int(input(f'nhập vào phần tử thứ {i+1}:'))
    array.append(num)
    
ngtos = []
for num in array:
    if tim_songto(num):
        ngtos.append(num)

ngtos.sort()

print('các số nguyên tố sắp xếp theo thứ tự tăng dần: ')
for ngto in ngtos:
    print(ngto)