# Định nghĩa hàm tính tổng các chữ số của một số nguyên
def tinh_tong_chu_so(n):
    tong = 0
    while n > 0:
        tong += n % 10  # Lấy chữ số cuối cùng và cộng vào tổng
        n //= 10  # Loại bỏ chữ số cuối cùng
    return tong

# Đọc N và K từ file input
with open("SONGUYEN49.INP", "r") as file_in:
    n, k = map(int, file_in.readline().split())

# Tính tổng S
s = n
for i in range(k):
    x10 = n * 10**i  # Nhân N với 10^i để tạo phần tử thứ i trong dãy S, ví dụ: N, N*10, N*100, ...
    s += x10  # Cộng phần tử thứ i vào tổng S

# Tính tổng các chữ số của S bằng cách gọi hàm tinh_tong_chu_so
tong_chu_so = tinh_tong_chu_so(s)

# Ghi kết quả vào file output
with open("SONGUYEN49.OUT", "w") as file_out:
    file_out.write(str(tong_chu_so))

"""
Giải thuật:

Đọc giá trị N và K từ file "SONGUYEN49.INP".
Khởi tạo biến s bằng giá trị N.
Dùng vòng lặp để tính toán các phần tử trong dãy S và cộng chúng vào biến s. 
Điều này đảm bảo rằng s sẽ chứa giá trị của dãy S.
Gọi hàm tinh_tong_chu_so để tính tổng các chữ số của giá trị s.
Ghi tổng các chữ số của s vào file "SONGUYEN49.OUT".

Giài thích hàm

def tinh_tong_chu_so(n):
    tong = 0
    while n > 0:
        tong += n % 10  # Lấy chữ số cuối cùng và cộng vào tổng
        n //= 10  # Loại bỏ chữ số cuối cùng
    return tong
tong = 0: Khởi tạo biến tong để lưu trữ tổng các chữ số của số nguyên n.
while n > 0:: Đây là một vòng lặp while sẽ tiếp tục thực hiện cho đến khi giá trị của n trở thành không lớn hơn 0. Trong ngữ cảnh này, vòng lặp sẽ tiếp tục cho đến khi tất cả các chữ số của n đã được xử lý.
tong += n % 10: Dòng này thực hiện hai việc cùng một lúc. n % 10 là phép lấy phần dư của n cho 10, tức là lấy chữ số cuối cùng của n. Điều này được cộng vào biến tong, để tích luỹ tổng các chữ số đã lấy.
n //= 10: Dòng này thực hiện việc loại bỏ chữ số cuối cùng của n bằng cách thực hiện phép chia nguyên n cho 10. Điều này giúp điều chỉnh n sao cho chữ số tiếp theo có thể được lấy và xử lý trong lần lặp tiếp theo.
Cuối cùng, sau khi tất cả các chữ số của n đã được xử lý và thêm vào tổng tong, giá trị của tong sẽ chứa tổng của tất cả các chữ số của n. Hàm tinh_tong_chu_so sẽ trả về giá trị này để được sử dụng ở nơi khác trong mã chương trình chính.
"""

