#Import module array để sử dụng kiểu dữ liệu mảng.
from array import array

#Sử dụng with statement để mở tệp tin đầu vào "KHAUTRANG.INP" trong chế độ đọc ('r') 
# và tệp tin đầu ra "KHAUTRANG.OUT" trong chế độ ghi ('w'). 
# Câu lệnh with tự động đảm bảo tệp tin được đóng sau khi hoàn thành.
with open('KHAUTRANG.INP', 'r') as file1, open('KHAUTRANG.OUT', 'w') as file2:

#Khởi tạo danh sách rỗng x để lưu trữ các vị trí và danh sách rỗng r để lưu trữ các bán kính. 
# Biến m được khởi tạo ban đầu với giá trị 0 để lưu trữ giá trị lớn nhất trong danh sách x.
    x = []
    r = []
    m = 0

#Đọc dòng đầu tiên của tệp tin đầu vào và chuyển đổi giá trị đọc được thành số nguyên, 
# gán vào biến n. Biến n đại diện cho số điểm sản xuất.
    n = int(file1.readline())

#Duyệt qua n dòng tiếp theo trong tệp tin đầu vào.
#Đọc từng dòng, chia thành các thành phần sử dụng phương thức split() và lưu vào danh sách x và r.
#Kiểm tra và cập nhật giá trị lớn nhất trong danh sách x bằng cách so sánh với m sử dụng hàm max().
    for _ in range(n):
        temp = file1.readline().split()
        x.append(int(temp[0]))
        r.append(int(temp[1]))
        m = max(m, int(temp[0]))

#Tạo một mảng a với kiểu dữ liệu 'b' (1 byte) sử dụng từ module array. 
# Kích thước mảng là (m + 1) và các giá trị ban đầu đều là 0.
    a = array('b', [0] * (m + 1))

#Duyệt qua từng phần tử trong danh sách x và r.
    for i in range(n):
        temp = x[i]
        for j in range(r[i] + 1):
            if temp - j >= 0: #Nếu temp - j (vị trí trừ đi khoảng cách) không nhỏ hơn 0, 
                a[temp - j] = 1 # thì đánh dấu phần tử tại vị trí temp - j trong mảng a bằng 1.
            if temp + j <= m: #Nếu temp + j (vị trí cộng thêm khoảng cách) không lớn hơn m,
                a[temp + j] = 1 # thì đánh dấu phần tử tại vị trí temp + j trong mảng a bằng 1.


#Sử dụng phương thức count(0) để đếm số lượng phần tử có giá trị 0 trong mảng a.
#Chuyển đổi kết quả thành chuỗi bằng cách sử dụng hàm str().
#Ghi kết quả vào tệp tin đầu ra bằng phương thức write().
    kq = str(a.count(0))
    file2.write(kq)

#Đóng tệp tin đầu vào và tệp tin đầu ra để giải phóng tài nguyên.
file1.close()
file2.close()

