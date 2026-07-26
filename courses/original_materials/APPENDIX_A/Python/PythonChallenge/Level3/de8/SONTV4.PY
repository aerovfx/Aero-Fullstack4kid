#Dòng này sử dụng để import các module array và math để sử dụng trong chương trình.
from array import *
from math import *

#Dòng này mở hai tệp tin, một để đọc (tên tệp là "NGUYENTO.INP") và một để ghi (tên tệp là "NGUYENTO.OUT"). Chế độ ghi ("w") được sử dụng cho file2, có nghĩa là nếu tệp đã tồn tại, nó sẽ bị ghi đè.
file = open("SONT.INP")
file2 = open("SONT.OUT","w")

#Đây là một hàm nguyento(num) được định nghĩa để kiểm tra xem một số num có phải là số nguyên tố hay không. 
#Hàm này sử dụng vòng lặp và kiểm tra chia hết để kiểm tra tính nguyên tố củ "num""

def nguyento(num):
    if num == 1:
        return False
    else:
        for i in range(2,int(sqrt(num)+1)):
            if num % i == 0:
                return False
        return True

#Dòng này đọc một dòng từ file và cố gắng chuyển đổi nó thành một số nguyên n. Nếu không thể chuyển đổi thành công, sẽ xảy ra một ngoại lệ ValueError và thông báo "Invalid value in the file." sẽ được in ra.
try:
    n = int(file.readline())
except ValueError:
    print("Invalid value in the file.")
#Dòng này đọc một dòng khác từ file và gán giá trị cho biến s. Sau đó, biến data được tạo bằng cách chia dòng thành một danh sách các chuỗi sử dụng phương thức split().
s = file.readline()
data = s.split()
#Dòng này tạo một mảng số nguyên rỗng có tên là dem bằng cách sử dụng lớp array từ module array.
dem = array("i")

#Dòng này kiểm tra xem danh sách data có ít nhất một phần tử hay không. Nếu có, giá trị đầu tiên của data được chuyển đổi thành số nguyên và gán cho m. Nếu danh sách rỗng, thông báo "The list is empty." sẽ được
if len(data) > 0:
    m = int(data[0])
else:
    # Handle the case when the list is empty
    print("The list is empty.")
try:
    n = int(file.readline())
except ValueError:
    print("Invalid value in the file.")
    # Xử lý lỗi, ví dụ: gán một giá trị mặc định cho n
    n = 0  # Hoặc một giá trị khác tùy thuộc vào logic của bạn

#Dòng này duyệt qua các phần tử trong danh sách data từ chỉ số 1 đến n-1 và so sánh giá trị của mỗi phần tử với m. Nếu phần tử hiện tại lớn hơn m, thì m được cập nhật với giá trị mới.
for i in range(1, n):
    if m < int(data[i]):
        m = int(data[i])


#Dòng này duyệt qua các giá trị từ 0 đến m (bao gồm) và thêm 0 vào mảng dem cho mỗi giá trị.
for i in range(m + 1):
    dem.append(0) # them 0 vao mang dem

#Dòng này duyệt qua từng phần tử trong danh sách data. Mỗi phần tử được chuyển đổi thành số nguyên và gán cho a. Nếu a là số nguyên tố (sử dụng hàm nguyento), thì giá trị tại chỉ số a trong mảng dem được tăng lên 1.
for i in range(n):
    a = int(data[i])
    if nguyento(a):
        dem[a] += 1
#Dòng này gán giá trị lớn nhất trong mảng dem cho m.
m = max(dem)

#Dòng này kiểm tra nếu m bằng 0, nghĩa là không có số nguyên tố nào trong danh sách data, thì ghi chuỗi "Khong tim duoc gia tri" vào tệp file2. Nếu không, ghi giá trị đầu tiên có chỉ số dem.index(m) và giá trị m vào tệp file2
if m == 0:
    file2.write("Khong tim duoc gia tri")
else:
    file2.write(str(dem.index(m))) + " " +str(m)

#Dòng này đóng tệp file và file2 sau khi hoàn thành công việc.
#Chương trình trên đọc một danh sách số từ tệp NGUYENTO.INP, đếm số lần xuất hiện của mỗi số nguyên tố trong danh sách và ghi kết quả vào tệp NGUYENTO.OUT.
file.close()
file2.close()

