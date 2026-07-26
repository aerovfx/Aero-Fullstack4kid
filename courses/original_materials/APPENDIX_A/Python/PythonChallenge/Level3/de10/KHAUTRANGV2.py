from array import array

try:
    with open('KHAUTRANG.INP', 'r') as file1, open('KHAUTRANG.OUT', 'w') as file2:
        x = []
        r = []
        m = 0

        n = int(file1.readline())
        for _ in range(n):
            temp_x, temp_r = map(int, file1.readline().split())
            x.append(temp_x)
            r.append(temp_r)
            m = max(m, temp_x)

        a = array('b', [0] * (m + 1))

        for i in range(n):
            temp = x[i]
            for j in range(r[i] + 1):
                if temp - j >= 0:
                    a[temp - j] = 1
                if temp + j <= m:
                    a[temp + j] = 1

        kq = str(a.count(0))
        file2.write(kq)

except IOError as e:
    print("Lỗi khi đọc hoặc ghi tệp tin:", str(e))
