# Hàm tình toán
def solve(n):
    result = -1
    digit_mapping = {
        1: 2,
        2: 5,
        3: 5,
        4: 4,
        5: 5,
        6: 6,
        7: 3,
        8: 7,
        9: 6,
        0: 6
    }

    h = 23
    while h >= 0 and result == -1:
        m = 59
        while m >= 0 and result == -1:
            s = 59
            while s >= 0 and result == -1:
                d = 0
                a = [0] * 6
                a[0] = h // 10
                a[1] = h % 10
                a[2] = m // 10
                a[3] = m % 10
                a[4] = s // 10
                a[5] = s % 10

                for digit in a:
                    d += digit_mapping[digit]
                
                if d == n:
                    result = f"{a[0]}{a[1]}:{a[2]}{a[3]}:{a[4]}{a[5]}"

                s -= 1
            m -= 1
        h -= 1

    return result

# Đọc dữ liệu từ file QUEDIEM.INP
with open("QUEDIEM.INP","r") as f:
    n = int(f.readline())

# TÍnh kết quả
result = solve(n)

# Ghi kết quả ra file QUEDIEM.OUT
with open("QUEDIEM.OUT","w") as f:
    f.write(str(result))



