import math
#ham kiem tra 1 diem co thuoc duong tron hay khong?
def kiem_tra_thuoc_duong_tron(a, b, r, x, y):
    # Tính khoảng cách từ điểm A đến tâm I của đường tròn
    khoang_cach = math.sqrt((x - a)**2 + (y - b)**2)

    # Kiểm tra xem điểm A có thuộc đường tròn hay không
    if khoang_cach <= r:
        return True
    else:
        return False

# Đọc dữ liệu từ file INPUT
with open("CIRCLE.INP", "r") as file:
    lines = file.readlines()
    
# Chuyển đổi dữ liệu vào các biến tương ứng
a, b, r = map(int, lines[0].strip().split())

# Tạo danh sách để lưu kết quả
ket_qua = []

# Kiểm tra xem các điểm có thuộc đường tròn hay không
for line in lines[1:]:
    x, y = map(int, line.strip().split())
    if kiem_tra_thuoc_duong_tron(a, b, r, x, y):
        ket_qua.append("Điểm A({},{}) thuộc đường tròn.".format(x, y))
    else:
        ket_qua.append("Điểm A({},{}) không thuộc đường tròn.".format(x, y))

# Xuất kết quả vào file OUTPUT
with open("CIRCLE.OUT", "w") as file:
    for kq in ket_qua:
        file.write(kq + "\n")
