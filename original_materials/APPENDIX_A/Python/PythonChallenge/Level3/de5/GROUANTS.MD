ĐỀ THI TỈNH VŨNG TÀU 2023.
Những con kiến đi kiếm ăn hay về tổ thường tổ chức đi theo từng đoàn. 
Trong một lần nọ, có một doàn kiến gồm m con đi trên một nhánh cây và được đánh số thứ tự từ 1 đến n,
con kiến thức i có vận tốc di chuyển riêng là v_i và có khối lượng tương ứng là k_i (với i = 1,2,...,n). 
Theo lộ trình thì đoàn kiến sẽ đi tuần tự theo số thứ tự để đi kiếm thức ăn. Tuy nhiên trên lộ trình đi có một cành cây không được đảm bảo để đoàn kiến qua lại thoải mái.
Được biết rằng nếu như tổng khối lượng của các con kiến cùng trên cành cây đó vượt qúa khối lượng m thì cành cây có thể bị cong hoặc gãy làm cho các con kiến có thể bị rơi xuống đất (tức là trong cùng một thời điểm thì tổng khối lượng các con kiến trên cành cây đó không được vượt quá khối lương m).
Chính vì thế khi qua cành cây các con kiến phải chia đoàn thành các nhóm sao cho tổng khối lượng của mỗi một nhóm không quá m, các con kiến trong từng nhóm hay các nhóm với nhau cũng phải tuân theo thứ tự ban đầu. Thêm vào đó nữa là các nhóm phải đi tuần tự, nghĩa là nhóm thứ i chỉ được đi qua khi mà toàn bộ kiến của nhóm thứ i -1 đi qua được cành cây đó. Vận tốc đi của mỗi nhóm là hoàn toàn khác nhau và phụ thuộc vào con kiến có tốc độ chậm nhất. Nhiệm vụ của đoàn kiến là phải đi qua cành cây đó.
Yêu cầu: Hãy sắp xếp đoàn kiến đi sao cho hợp lý để tổng thời gian qua cảnh cây đó là nhỏ nhất.
Dữ liệu: Vào từ file GROUANTS.INP
-Dòng đầu là 3 số nguyên dương n, m , l với:
n là số lượng kiến của đoàn.
m là tải trọng tối đa của cành cây (tổng khối lượng tối đa của nhóm kiến có thể cùng qua được cành cây)
l là độ dài của cành cây ( 1 <= n < = 1000; 1 <= m, l <= 100).
Trong  n dòng sau, dòng thứ i là 2 số nguyên dương k_i và v_i thể hiện cho khối lượng và vận tốc của con kiến thứ i (1 <= k_i, v_i <= 100 với i = 1, 2, ...,n)
Kết quả: Ghi vào file GROUANTS.OUT tổng thời gian nhỏ nhất để đoàn kiến qua được cành cây (lấy 2 số phần thập phân)

Ví dụ:
-----------------------------------------------
| GROUANTS.INP       | GROUANTS.OUT           |
| 6 10 10            |20.00                   |  
| 3 5                |                        |  
| 6 2                |                        | 
| 5 2                |                        |  
| 7 1                |                        |  
| 1 5                |                        |
| 2 7                |                        |  
-----------------------------------------------
Chú thích: 
Dựa vào khối lượng tối đa, ta có thể chia là 6 nhóm kiến.
Nhóm 1 (gồm con kiến thứ 1 và con kiến số 2 có khối lượng tổng cộng là 9 và vận tốc nhỏ nhất là 2 nên thời gian đi là 10/2 = 5)
Nhóm 2 (chỉ có con kiến số 3 do đi tuần tự nên không thể đi cùng con kiến thứ 4 do khối lượng tổng phải nhỏ hơn hoặc bằng 10, vật con kiến này đi vận tốc là 2 nên thời gian đi là 10/2 = 5)
Nhóm 3 (gồm kiến 4,5,6 có tổng khối lượng là 7 + 1 + 2 = 9 và vận tốc chậm nhất là 1 nên thời gian đi là 10/1 = 10)

Tổng thời gian đi của 3 nhóm là 5 + 5 + 10 = 20. In ra file GROUANTS.OUT

Ràng buộc dữ liệu:
-Có 60% test có n <= 10^6
-Có 40% test khác có n <= 10^(12)

HD THUẬT TOÁN
# Khởi tạo các thông tin về nhóm kiến
nhom1_khoi_luong = 9
nhom1_van_toc = 2

nhom2_khoi_luong = 5
nhom2_van_toc = 2

nhom3_khoi_luong = 10
nhom3_van_toc = 1

# Tính thời gian đi qua cành cây của từng nhóm
nhom1_thoi_gian = 10 / nhom1_van_toc
nhom2_thoi_gian = 10 / nhom2_van_toc
nhom3_thoi_gian = 10 / nhom3_van_toc

# Tính tổng thời gian nhỏ nhất
tong_thoi_gian = nhom1_thoi_gian + nhom2_thoi_gian + nhom3_thoi_gian

# In ra màn hình kết quả
print("Thời gian nhỏ nhất là:", tong_thoi_gian)
Để giải quyết bài toán này, ta có thể sử dụng thuật toán tham lam (greedy algorithm) để sắp xếp các con kiến và tạo các nhóm đi qua cành cây.

Bước 1: Đọc dữ liệu từ file GROUANTS.INP

Bước 2: Sắp xếp các con kiến theo thứ tự tăng dần của vận tốc di chuyển.

Bước 3: Tạo các nhóm và tính thời gian đi của mỗi nhóm:

Khởi tạo biến nhóm = 0 (số nhóm ban đầu là 0)
Khởi tạo biến tổng khối lượng = 0 (tổng khối lượng của các con kiến trong một nhóm)
Khởi tạo biến thời gian = 0 (tổng thời gian đi qua cành cây)
Duyệt qua từng con kiến:
Nếu (tổng khối lượng + khối lượng con kiến) <= m (khối lượng tối đa cho phép trong một nhóm):
Tổng khối lượng = tổng khối lượng + khối lượng con kiến
Thời gian = thời gian + (khối lượng con kiến / vận tốc con kiến)
Ngược lại:
Tăng số nhóm lên 1
Gán tổng khối lượng bằng khối lượng con kiến
Thời gian = thời gian + (khối lượng con kiến / vận tốc con kiến)
Ghi tổng thời gian vào file GROUANTS.OUT
Bước 4: Kết thúc.

# Dữ liệu đầu vào
n = 6
m = 10
l = 10
ants = [
    [3, 5],
    [6, 2],
    [5, 2],
    [7, 1],
    [1, 5],
    [2, 7]
]

# Tính tổng khối lượng của từng nhóm kiến
nhom1_khoi_luong = ants[0][0] + ants[1][0]
nhom2_khoi_luong = ants[2][0]
nhom3_khoi_luong = ants[3][0] + ants[4][0] + ants[5][0]

# Tính thời gian đi qua cành cây của từng nhóm
nhom1_thoi_gian = m / min(ants[0][1], ants[1][1])
nhom2_thoi_gian = m / ants[2][1]
nhom3_thoi_gian = l / min(ants[3][1], ants[4][1], ants[5][1])

# Tính tổng thời gian nhỏ nhất
tong_thoi_gian = nhom1_thoi_gian + nhom2_thoi_gian + nhom3_thoi_gian

# In ra màn hình kết quả
print("Thời gian nhỏ nhất là:", tong_thoi_gian)
