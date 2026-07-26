def tinh_nghich_the(P):
    n = len(P)
    T = [0] * n

    for i in range(1, n + 1):
        count = 0
        for j in range(i + 1, n + 1):
            if P.index(i) > P.index(j):
                count += 1
        T[i - 1] = count

    return T

n = int(input('nhập số n: '))


 # nhập hoán vị p từ người dùng 
p_hoanvi = input('nhập hoán vị p, các số cách nhau bởi dấu phẩy: ')
p = list(map(int, p_hoanvi.split(',')))

 # tìm và in ra ngịch thế t của hoán vị p
t = tinh_nghich_the(p)
print('dãy ngịch thế t: ',t) 