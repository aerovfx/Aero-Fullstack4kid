#Bài 11. Viết chương trình hỏi người dùng một số tự nhiên n và in ra tất cả ước số của con số đó.
n = int(input("Nhap vao so nguyen n: "))
for i in range(1, n + 1):
    if n % i == 0:
        print(i)