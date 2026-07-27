#Tao va in bang nhan: 9 dong va 10 cot
a = []# khoi tao danh sach rong
for i in range(1,10):
    a.append([])
    for j in range(1,11):
        x = i*j
        a[i-1].append(x)
for i in range(0,9):
    for j in range(0,10):
        print("%3d" %a[i][j], end='')
    print()
input()

"""
a = []: Khởi tạo một danh sách rỗng có tên là a.
for i in range(1, 10):: Lặp qua các giá trị từ 1 đến 9 (bao gồm 1 và không bao gồm 10) và gán giá trị hiện tại cho biến i.
a.append([]): Thêm một danh sách rỗng vào danh sách a.
for j in range(1, 11):: Lặp qua các giá trị từ 1 đến 10 (bao gồm cả 1 và 10) và gán giá trị hiện tại cho biến j.
x = i * j: Nhân giá trị của i với giá trị của j và gán kết quả cho biến x.
a[i-1].append(x): Thêm giá trị của x vào danh sách thứ (i-1) trong danh sách a. Lưu ý rằng chỉ số của danh sách bắt đầu từ 0 nên ta trừ 1 để lấy đúng vị trí.
for i in range(0, 9):: Lặp qua các giá trị từ 0 đến 8 (bao gồm cả 0 và 8) và gán giá trị hiện tại cho biến i.
for j in range(0, 10):: Lặp qua các giá trị từ 0 đến 9 (bao gồm cả 0 và 9) và gán giá trị hiện tại cho biến j.
print("%3d" % a[i][j], end=''): In giá trị của a[i][j] với định dạng dạng số nguyên có chiều rộng là 3. Dấu % được sử dụng để định dạng chuỗi. a[i][j] là phần tử thứ j trong danh sách thứ i của a. end='' được sử dụng để không thêm khoảng trắng hay ký tự xuống dòng sau khi in.
print(): In một dòng trống để tạo dòng mới.
input(): Đợi người dùng nhập vào một giá trị từ bàn phím.

KQ:
1  2  3  4  5  6  7  8  9 10
  2  4  6  8 10 12 14 16 18 20
  3  6  9 12 15 18 21 24 27 30
  4  8 12 16 20 24 28 32 36 40
  5 10 15 20 25 30 35 40 45 50
  6 12 18 24 30 36 42 48 54 60
  7 14 21 28 35 42 49 56 63 70
  8 16 24 32 40 48 56 64 72 80
  9 18 27 36 45 54 63 72 81 90git add 
"""