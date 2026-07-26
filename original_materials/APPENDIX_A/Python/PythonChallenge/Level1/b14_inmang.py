#Bài 14. Viết một chương trình nhập vào hai số tự nhiên m, n. In ra màn hình mảng hai chiều mà phần tử trong hàng thứ i và cột thứ j của mảng là i*j.
m, n = map(int, input('Nhap vao 2 so: ').split())
array2 = [[0 for i in range(n)] for j in range(m)]
for row in range(m):
    for col in range(n):
        array2[row][col] = row * col
print(array2)
