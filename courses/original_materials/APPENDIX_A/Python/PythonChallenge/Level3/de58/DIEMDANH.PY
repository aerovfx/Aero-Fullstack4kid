def main():
    # Đọc dữ liệu từ file đầu vào
    with open("DIEMDANH.INP", "r") as file_input:
        N = int(file_input.readline().strip())
        danh_sach = [file_input.readline().strip() for _ in range(2 * N - 1)]

    # Tạo danh sách để lưu trạng thái ghi danh của học sinh
    print(danh_sach)
    diem_danh = [0] * N
    print(diem_danh)
    # Đọc danh sách tên của N - 1 học sinh đã ghi danh
    for i in range(N, 2 * N - 1):
        ten = danh_sach[i]
        # Nếu tên đã xuất hiện trong danh sách, đánh dấu là đã ghi danh
        if ten in danh_sach:
            diem_danh[danh_sach.index(ten)] = 1

    # Tìm học sinh chưa ghi danh
    # chua_ghi_danh = [ten for ten, ghi_danh in zip(danh_sach, diem_danh) if ghi_danh == 0]
    chua_ghi_danh = []
    for ten, ghi_danh in zip(danh_sach, diem_danh):
        if ghi_danh == 0:
            chua_ghi_danh.append(ten)

    print(chua_ghi_danh)
    # Ghi kết quả vào file DIEMDANH.OUT
    with open("DIEMDANH.OUT", "w") as file_output:
        for ten in chua_ghi_danh:
            file_output.write(ten + "\n")

if __name__ == "__main__":
    main()
