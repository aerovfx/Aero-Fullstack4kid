def tinh_trung_binh_cong(A):
    tong = 0
    dem = 0
    chia = 0
    vt0 = []
    for i in range(len(A)):
        num = A[i]

        if num > 0:
            tong += num
            dem += 1
        if num % 3 == 0 :
            chia += 1
        if num == 0:
            vt0.append(i)
    trung_binh_cong = tong / dem 
    print('Vị trí các số bằng 0 là:', vt0)
    print("Trung bình cộng các số dương trong dãy: ", trung_binh_cong)
    print('Các số chia hết cho 3 là:', chia)
danh_sach = [2, 0, -5, 3, 6, 7, 0]
tinh_trung_binh_cong(danh_sach)
        