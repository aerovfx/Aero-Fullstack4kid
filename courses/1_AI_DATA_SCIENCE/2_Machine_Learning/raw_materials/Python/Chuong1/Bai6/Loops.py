"""
#Tinh tong n so nguyen dau tien, yeu cau nhap vao so nguyen thu n
n = input("Nhap vao so nguyen thu n =")
s = 0
i = 1
while (i <= int(n)) :
    s = s + i
    i = i + 1
print("Tong cua n so nguyen lien tiep la", s)

"""
#Tinh lai ngan hang
tienvay = input("Nhap vao so tien van vay ")
laisuat = 0.1
print("tien lai la ", float(tienvay)*laisuat)
thang = input("Nhap vap so thang vay")
print("Tien phai tra la",float(tienvay)+ float(thang)*float(tienvay)*laisuat)

#Gia su vay 500tr, lai suat 0.1 va vay trong 10 thang
#Mot thang chi tra duoc 10tr thi tra trong bao lau het tien
"""
#In ra các số chẵn với vòng lặp for
n = input("Nhap vao n= ")
s =0 
for i in range(0, int(n)):
    s = s +1
    if s%2 == 0:
        print(s)

"""

#In ra các số lẻ với vòng lặp for
n = input("Nhap vao n= ")
s =0 
for i in range(0, int(n)):
    s = s +1
    if s%2 != 0:
        print(s)