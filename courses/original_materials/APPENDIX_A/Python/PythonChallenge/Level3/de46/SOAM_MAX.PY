def main():
    N = int(input("Nhập số N (N <= 50): "))
    if N <= 0 or N > 50:
        print("Số N không hợp lệ.")
        return

    # Nhập dãy N số nguyên từ bàn phím
    danh_sach = []
    for i in range(N):
        num = int(input(f"Nhập số thứ {i + 1}: "))
        danh_sach.append(num)

    # Tính số dương chẵn
    so_duong_chan = 0
    for num in danh_sach:
        if num > 0 and num % 2 == 0:
            so_duong_chan += 1

    # Tìm chỉ số của giá trị âm lớn nhất
    max_am = None
    chi_so_max_am = []
    for i in range(len(danh_sach)):
        if max_am is None or danh_sach[i] > max_am:
            max_am = danh_sach[i]
            chi_so_max_am = [i]
        elif danh_sach[i] == max_am:
            chi_so_max_am.append(i)

    # Tìm tất cả các dãy con dài nhất các số dương cùng dấu
    danh_sach_con = []
    current_con = []
    for num in danh_sach:
        if not current_con or (current_con[-1] > 0 and num > 0) or (current_con[-1] < 0 and num < 0):
            current_con.append(num)
        else:
            if current_con[-1] > 0:
                danh_sach_con.append(current_con)
            current_con = [num]

    if current_con and current_con[-1] > 0:
        danh_sach_con.append(current_con)

    # In kết quả
    print("Số dương chẵn trong dãy là:", so_duong_chan)
    print("Chỉ số của giá trị âm lớn nhất:", chi_so_max_am)
    print("Tất cả các dãy con dài nhất các số dương cùng dấu:")
    for con in danh_sach_con:
        print(con)


if __name__ == "__main__":
    main()
