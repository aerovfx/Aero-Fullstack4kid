def nen(n):
    n = int(input('Nhap vao gia tri n: '))     #Nhap vao gia tri n:
    A = list(range(1,n+1))                     #Nhap vao day so A:
    while len(A) > 1:                          #Neu A>1 thi chay con neu A=1 thi dung
        B = []
        for i in range(0, len(A)-1):           #Lap tu 0 den chieu dai cua day A
            B.append(A[i] + A[i+1])            #Cong cac ptu ke canh nhau
            # print(kq)
        A = B
        kq = A[0] % 10**9                      #Chia de lay gtri nho hon 10^9
        # print(A)
    return kq 

print(nen(4))                                  #In ra kq