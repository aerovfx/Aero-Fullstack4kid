"""
Đây là một chương trình Python để tính số ngày giữa hai ngày được cung cấp trong tệp đầu vào "SONGAY.INP" và ghi kết quả vào tệp đầu ra "SONGAY.OUT". Dưới đây là các chú thích cho từng dòng code:
"""
def day_month(m,y ):
    in_31 = [1, 3, 5, 7, 8, 10, 12]  # Danh sách các tháng có 31 ngày
    in_30 = [4, 6, 9, 11]  # Danh sách các tháng có 30 ngày
    if m in in_31: return 31  # Nếu tháng có 31 ngày thì trả về 31
    elif m in in_30: return 30  # Nếu tháng có 30 ngày thì trả về 30
    else:
        if y%4==0: return 29  # Nếu năm là năm nhuận và tháng là tháng 2 thì trả về 29
        else: return 28  # Ngược lại, không phải là năm nhuận thì trả về 28

#Hàm day_month(m, y) trả về số ngày trong tháng m của năm y.

def songay(d1,m1,y1,d2,m2,y2):
    s = 0  # Khởi tạo biến đếm số ngày
    if y2-y1 < 0: return 0  # Nếu năm đầu tiên lớn hơn năm thứ hai, trả về 0
    if y2-y1 == 0: 
        if m2 <m1 : return 0  # Nếu tháng đầu tiên lớn hơn tháng thứ hai, trả về 0
        elif m2==m1:
            if d2 < d1: return 0  # Nếu ngày đầu tiên lớn hơn ngày thứ hai, trả về 0
            else: return d2-d1  # Ngược lại, trả về chênh lệch ngày
        else:
            for i in range(m1+1 , m2): 
                s = s + day_month(i,y1)  # Tính số ngày trong các tháng giữa tháng đầu tiên và tháng thứ hai
            return s + (day_month(m1,y1) - d1) + d2  # Tổng số ngày là số ngày giữa các tháng cộng thêm số ngày từ ngày đầu tiên đến hết tháng đầu tiên cộng thêm số ngày từ đầu tháng thứ hai đến ngày thứ hai.
    for i in range(m1+1,13):
        s = s + day_month(i,y1)  # Tính số ngày trong các tháng từ tháng đầu tiên đến tháng 12 của năm đầu tiên
    for i in range(1,m2):
        s = s + day_month(i,y2)  
    dem = 0
    for i in range(y1+1,y2):
        if day_month(2,i)==29: # 
            dem = dem +1
    return (y2-y1-1)*365 + dem + s + (day_month(m1,y1) - d1) + d2
"""
Dòng code trên là một vòng lặp for sử dụng để tính tổng số ngày của các tháng trong năm y2 tính từ tháng 1 đến tháng m2-1.

m2 là tháng cuối cùng trong khoảng thời gian cần tính toán.
1 là tháng đầu tiên trong năm.
ranger(1, m2) là một hàm hoặc phương thức không được định nghĩa trong đoạn mã bạn cung cấp, tuy nhiên giả sử đây là một hàm trả về một chuỗi số nguyên liên tiếp từ 1 đến m2.
Mỗi lần lặp qua vòng lặp for, giá trị của biến i sẽ lần lượt là 1, 2, 3, ..., m2-1. Với mỗi giá trị i, chương trình sẽ tính số ngày của tháng i trong năm y2 bằng cách gọi hàm day_month(i, y2) và cộng vào biến s.

Sau khi vòng lặp kết thúc, biến s sẽ lưu trữ tổng số ngày của các tháng trong năm y2 tính từ tháng 1 đến tháng m2-1.
"""
"""
 Cuối cùng, chương trình ghi kết quả tính toán được vào tệp đầu ra "SONGAY.OUT" sử dụng phương thức .write(). Kết quả này được làm tròn đến một chữ số thập phân sử dụng hàm round() và được chuyển thành một chuỗi sử dụng hàm str() trước khi ghi vào tệp đầu ra.

Sau khi hoàn tất công việc, chương trình đóng cả hai tệp đầu vào và đầu ra sử dụng phương thức .close().

"""

f_in = open("SONGAY.INP","r"); f_out = open("SONGAY.OUT","w")
line_1 = f_in.readline().split()
line_2 = f_in.readline().split()
#Tao mang
arr_1 = [int(x) for x in line_1];
arr_2 = [int(x) for x in line_2];
f_out.write(str(round(songay(arr_1[0],arr_1[1],arr_1[2],arr_2[0],arr_2[1],arr_2[2]),1)))
f_in.close(); f_out.close();