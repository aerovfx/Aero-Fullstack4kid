def tinh_gia_tri_S(x):
    S = 1.0  # Khởi tạo giá trị ban đầu của S là 1.0
    term = x  # Khởi tạo số hạng ban đầu là x
    n = 1  # Khởi tạo chỉ số n là 1

    while abs(term) >= 1e-5:  # Kiểm tra điều kiện độ chính xác
        S += term  # Cộng số hạng vào tổng S
        n += 1  # Tăng chỉ số n lên 1
        term *= x / n  # Tính số hạng tiếp theo

    return S

# Ví dụ sử dụng
x = float(input("Nhập giá trị x: "))
gia_tri_S = tinh_gia_tri_S(x)
print("Giá trị của biểu thức S:", gia_tri_S)
