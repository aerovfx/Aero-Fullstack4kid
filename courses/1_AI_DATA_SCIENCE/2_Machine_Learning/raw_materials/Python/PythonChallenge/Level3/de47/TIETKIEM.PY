def so_thang_gui_tiet_kiem(a, b):
    so_thang = 0
    while a < b:
        a += a * 0.008  # Tăng số tiền gốc theo lãi suất hàng tháng
        so_thang += 1
    return so_thang

def main():
    # Đọc dữ liệu từ file TIETKIEM.INP
    with open("TIETKIEM.INP", "r") as file:
        a, b = map(int, file.readline().split())

    # Tính số tháng ít nhất cần gửi tiết kiệm
    so_thang_can_gui = so_thang_gui_tiet_kiem(a, b)

    # Ghi kết quả vào file TIETKIEM.OUT
    with open("TIETKIEM.OUT", "w") as file:
        file.write(str(so_thang_can_gui))

if __name__ == "__main__":
    main()
