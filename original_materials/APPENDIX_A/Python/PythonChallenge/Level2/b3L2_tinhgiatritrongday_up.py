def calculate_sequence_value(sequence, n):
    if n <= len(sequence):
        return sequence[n-1]
    else:
        a = sequence[0]
        b = sequence[1]
        for i in range(3, n + 1):
            c = b + (i - 2) * (sequence[i-3] - sequence[i-4])
            a = b
            b = c
        return c

sequence_str = input("Nhập dãy số, các số cách nhau bằng dấu phẩy: ")
sequence = [int(x) for x in sequence_str.split(',')]
n = int(input("Nhập vị trí n: "))

sequence_value = calculate_sequence_value(sequence, n)
print(f"Giá trị của số đứng ở vị trí {n} trong dãy là: {sequence_value}")

#day nhap bat ky tu ban phim