def sap_xep_cho_ngoi_xe_bus():
    # Đọc thông tin đặt chỗ từ file "DATCHO.INP"
    try:
        with open("DATCHO.INP", "r") as file:
            line = file.readline().split()
            so_tang = int(line[0])
            so_ghe = int(line[1])

            # Khởi tạo ma trận lưu thông tin về sự đặt chỗ của hành khách
            ghe_ngoi = []
            for i in range(so_tang):
                dong = file.readline()
                ghe_duoc_dat = [int(x) for x in dong.split()]
                ghe_ngoi.append(ghe_duoc_dat)
    except FileNotFoundError:
        print("Không tìm thấy tập tin 'DATCHO.INP'. Vui lòng kiểm tra lại tên và đường dẫn của tập tin.")
        return

    # Sắp xếp chỗ ngồi trên xe bus
    for i in range(so_tang):
        for j in range(so_ghe - 1):
            for k in range(j + 1, so_ghe):
                if ghe_ngoi[i][j] == 0 and ghe_ngoi[i][k] == 1:
                    # Hoán đổi giá trị của các ghế cùng hàng để đưa ghế trống về phía trước
                    ghe_ngoi[i][j], ghe_ngoi[i][k] = ghe_ngoi[i][k], ghe_ngoi[i][j]

    # Ghi danh sách chỗ ngồi sau khi sắp xếp vào file "DATCHO.OUT"
    try:
        with open("DATCHO.OUT", "w") as file:
            for i in range(so_tang):
                for j in range(so_ghe):
                    file.write(str(ghe_ngoi[i][j]) + " ")
                file.write("\n")
    except PermissionError:
        print("Không thể ghi vào tập tin 'DATCHO.OUT'. Vui lòng kiểm tra quyền ghi và đường dẫn của tập tin.")

    print("Đã ghi kết quả vào tập tin 'DATCHO.OUT'.")


# Chạy chương trình
sap_xep_cho_ngoi_xe_bus()
