def tbc(A):
    tong = 0
    dem = 0
    for i in range(len(A)):
        num = A[i]

        if num > 0:
            tong += num
            dem += 1
        

    trung_binh_cong = tong / dem 
    print("Trung bình cộng các số dương trong dãy: ", trung_binh_cong)

danh_sach = [2, 4, -5, 8, 0, 9, 0, 12, -6, 10]
tbc(danh_sach)