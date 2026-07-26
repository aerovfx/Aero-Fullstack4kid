# Hàm vẽ ra tam giác Pascal
def ve_pascal(n):
    triangle = [] # Danh sách rỗng lưu tam giác pascal
    for i in range(n):
        row = [] # Hàng rỗng
        for j in range(i + 1):
            row.append(giatri_pascal(i,j)) # Thêm giá trị các phần tử của từng hàng
        triangle.append(row) # Thêm hàng vào tam giác Pascal
    return triangle # Trả về tam giác pascal đã tạo ra

# Hàm tính giá trị các phần tử trong tam giác pascal
def giatri_pascal(row,col):
    if col == 0 or col == row:
        return 1 # Trả về giá trị của phần tử biên và đỉnh là 1
    else:
        # Giá trị của một ô bất kỳ là tổng của 2 ô phía trên
        return giatri_pascal(row-1,col) + giatri_pascal(row-1,col-1)
# Test giá trị với n = 5 và in ra kết quả
n = 5
result = ve_pascal(n) # Gọi hàm vẽ tam giác pascal

for row in result:
    print(row) # In từng hàng