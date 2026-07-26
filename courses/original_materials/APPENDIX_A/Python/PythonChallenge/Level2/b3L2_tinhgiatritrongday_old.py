def calculate_sequence_value(n):
    if n == 1:
        return 2
    elif n == 2:
        return 4
    else:
        a = 2
        b = 4
        for i in range(3, n + 1):
            c = b + (i - 2) * 3
            a = b
            b = c
        return c

n = int(input("Nhập vị trí n: "))
sequence_value = calculate_sequence_value(n)
print(f"Giá trị của số đứng ở vị trí {n} trong dãy là: {sequence_value}")

#viết mã lệnh python giải quyết bài toán sau: cho dãy số 2,4,7,10,14,18
#viết hàm tính giá trị của số đứng ở vị trí n của dãy trên