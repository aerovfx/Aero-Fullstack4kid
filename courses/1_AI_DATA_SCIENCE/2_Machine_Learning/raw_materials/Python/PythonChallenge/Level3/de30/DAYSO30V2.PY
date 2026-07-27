def tinh_trung_binh_cong(A):
    sum_positive = 0
    count_positive = 0
    sum_zero = 0
    vitri_0 = []

    for i in range(len(A)):
        num = A[i]

        if num > 0:
            sum_positive += num
            count_positive += 1
        elif num == 0:
            ##sum_zero += 1
            vitri_0.append(i)

    trung_binh_cong = sum_positive / count_positive if count_positive > 0 else 0

    print("Trung bình cộng các số dương trong dãy: ", trung_binh_cong)
    print("Số lượng số chia hết cho 3 trong dãy: ", sum(1 for num in A if num % 3 == 0))
    print("Vị trí các số bằng 0 trong dãy: ", vitri_0)


# Ví dụ sử dụng, bạn có thể thay đổi giá trị của danh sách để nhận kết quả khác.
danh_sach = [2, 4, -5, 8, 0, 9, 0, 12, -6, 10]
tinh_trung_binh_cong(danh_sach)

