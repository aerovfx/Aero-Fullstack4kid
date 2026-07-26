#Import module array để sử dụng kiểu dữ liệu mảng.
from array import * 
#Mở tệp tin 'KHAUTRANG.INP' để đọc dữ liệu và tạo tệp tin 'KHAUTRANG.OUT' để ghi kết quả.
file1 = open('KHAUTRANG.INP')
file2 = open('KHAUTRANG.OUT', 'w')

#Khai báo các danh sách (list) x, r, a và biến m với giá trị khởi tạo ban đầu là 0.
#x là vị trí
#r là bán kính
#a là mảng
#m là biến đếm max
x = []
r = []
a = []
m = 0

#Đọc dòng đầu tiên của tệp tin đầu vào và chuyển đổi giá trị thành số nguyên, gán vào biến n.
n = int(file1.readline())

#Duyệt qua n dòng tiếp theo trong tệp tin đầu vào. 
# Đọc từng dòng, chia thành các thành phần và lưu vào danh sách x và r. 
# Đồng thời, tìm giá trị lớn nhất của x và gán vào biến m.
for i in range(n):
    temp = file1.readline()
    temp = temp.split()
    x.append(int(temp[0]))
    r.append(int(temp[1]))
    if m < int(temp[0]):
        m = int(temp[0])

#ạo một danh sách a có độ dài là m + 1 và các giá trị ban đầu đều là 0.
for i in range(m+1):
    a.append(0)

#Duyệt qua từng phần tử trong danh sách x và r. 
# Với mỗi phần tử temp trong x, đánh dấu các phần tử tương ứng trong danh sách a
#  từ temp - r[i] đến temp + r[i] bằng 1.
for i in range(n): # Duyệt qua tất cả các phần tử trong danh sách x và r
    temp = x[i] # Gán giá trị của phần tử x[i] vào biến temp
    for j in range(r[i]+1): # Duyệt qua các giá trị từ 0 đến r[i]
        if (temp - j) >= 0: # Nếu temp - j >= 0
            a[temp - j] = 1 # Đánh dấu phần tử tại vị trí temp - j trong danh sách a là 1
        if (temp + j) <= m: # Nếu temp + j <= m
            a[temp + j] = 1 # Đánh dấu phần tử tại vị trí temp + j trong da

#Đếm số lượng phần tử có giá trị 0 trong danh sách a, 
# chuyển đổi kết quả thành chuỗi và ghi vào tệp tin đầu ra.
kq = str(a.count(0))
file2.write(kq)

#Đóng tập tin in và out
file1.close()
file2.close()
