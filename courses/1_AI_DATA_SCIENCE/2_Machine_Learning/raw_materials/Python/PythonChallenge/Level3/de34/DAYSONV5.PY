def sap_xep_va_gom_so(A):
    nums_divisible_by_7 = []
    nums_divisible_by_5 = []
    other_nums = []

    for num in A:
        if num % 7 == 0:
            nums_divisible_by_7.append(num)
        elif num % 5 == 0:
            nums_divisible_by_5.append(num)
        else:
            other_nums.append(num)

    sorted_nums = sorted(nums_divisible_by_7) + sorted(other_nums) + sorted(nums_divisible_by_5)
    return sorted_nums

# Ví dụ sử dụng
danh_sach = [21, 10, 35, 14, 5, 28, 30, 7, 42, 33, 54, 55, 15, 21]
ket_qua = sap_xep_va_gom_so(danh_sach)
print(ket_qua)
