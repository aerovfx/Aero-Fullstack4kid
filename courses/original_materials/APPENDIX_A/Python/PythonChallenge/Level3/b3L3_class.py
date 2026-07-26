"""Bài 3:

Câu hỏi:

Xác định một class với generator có thể lặp lại các số nằm trong khoảng 0 và n, và chia hết cho 7.

Gợi ý:

Sử dụng yield.
"""
def putNumbers(n):
    i = 0
    while i<n:
        j=i
        i=i+1
        if j%7==0:
            yield j
n = int(input("Nhap vao so n = "))
for i in putNumbers (n):
     print (i)