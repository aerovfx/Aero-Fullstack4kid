import random
print('Go phim de xem ket qua')
A = random.randint(0, 10)
A = int(A) % 2
B = random.randint(0, 10)
B = int(B) % 2
C = random.randint(0, 10)
C = int(C) % 2
print('Ket qua:',A,B,C)
if (int(A)==0) and (int(B)==0) and (int(C)==0):print('Hoa')
if (int(A)==0) and (int(B)==0) and (int(C)==1):print('C Thang')
if (int(A)==0) and (int(B)==1) and (int(C)==0):print('B Thang')
if (int(A)==0) and (int(B)==1) and (int(C)==1):print('A Thang')
if (int(A)==1) and (int(B)==0) and (int(C)==0):print('A Thang')
if (int(A)==1) and (int(B)==0) and (int(C)==1):print('B Thang')
if (int(A)==1) and (int(B)==1) and (int(C)==0):print('C Thang')
if (int(A)==1) and (int(B)==1) and (int(C)==1):print('Hoa')