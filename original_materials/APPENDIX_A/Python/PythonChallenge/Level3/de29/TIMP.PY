P = 0.0
n = 1
fraction = 1.0

while abs(fraction) >= 1e-5:
    P += fraction
    n += 1
    fraction = (-1) ** (n + 1) / (2 * n - 1)

print("Giá trị của P là:", P)
