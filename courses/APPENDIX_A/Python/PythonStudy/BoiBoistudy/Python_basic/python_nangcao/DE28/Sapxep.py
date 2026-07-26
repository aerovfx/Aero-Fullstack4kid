
danh_sach = [2, 5, 9, 21, 7, 10, 15, 11]
def sap_xep(A):
    chia_7 = []
    chia_5 = []
    other_nums = []

    for num in A:
        if num % 7 == 0:
            chia_7.append(num)
        elif num % 5 == 0:
            chia_5.append(num)
        else:
            other_nums.append(num)

    sorted_nums = sorted(chia_7) + sorted(other_nums) + sorted(chia_5)
    return sorted_nums
sap_xep(danh_sach)

print('Danh sách sau khi sắp xếp là:', sap_xep(danh_sach))

