def sap_xep_cho_ngoi_may_bay():
    # Đọc thông tin đặt chỗ từ người dùng
    so_tang = int(input("Nhập số lượng tầng trên máy bay: "))
    so_hang_ghe = int(input("Nhập số lượng hàng ghế trên mỗi tầng: "))

    # Khởi tạo ma trận lưu thông tin về sự đặt chỗ của hành khách
    ghe_ngoi = []
    for i in range(so_tang):
        ghe_duoc_dat = input(f"Nhập thông tin đặt chỗ của tầng {i+1} (0: chỗ trống, 1: chỗ đã có người): ")
        ghe_duoc_dat = [int(x) for x in ghe_duoc_dat.split()]
        ghe_ngoi.append(ghe_duoc_dat)

    # Sắp xếp chỗ ngồi trên máy bay
    for tang in ghe_ngoi:
        tang.sort(key=lambda x: -x)

    # In ra danh sách chỗ ngồi sau khi sắp xếp
    print("Danh sách chỗ ngồi sau khi sắp xếp:")
    for tang in ghe_ngoi:
        for ghe in tang:
            print(ghe, end=" ")
        print()


# Chạy chương trình
sap_xep_cho_ngoi_may_bay()
