print('CHUONG TRINH DIEN TICH CAC HINH')
print('-------------------------------')
print('1. DIEN TICH HINH TAM GIAC')
print('2. DIEN TICH HINH VUONG')
print('3. DIEN TICH HINH CHU NHAT')
print('4. DIEN TICH HINH THANG')
print('5. DIEN TICH HINH TRON')
chon = input('Moi ban chon hinh can tinh dien tich:')
if (int(chon)==1):
    a=input('cho biet canh day:')
    b=input('Cho biet chieu cao:')
    s=(int(a)*int(b))/2
if (int(chon)==2):
    a=input('cho biet chieu dai canh:')
    s=int(a)*int(a)
if (int(chon)==3):
    a=input('cho biet chieu dai:')
    b=input('cho biet chieu rong')
    s=a*b
if (int(chon)==4):
    a=input('cho biet day lon:')
    b=input('cho biet day nho:')
    c=input('cho biet chieu cao:')
    s=(int(a)+int(b))*int(c)/2
if (int(chon)==5):
    a=input('cho biet ban kinh:')
    s=int(a)*int(a)*3.14
if (int(chon)<=0) or (int(chon)>5):print('Chon sai roi!!!')
print('Dien tich cua hinh la:',int(s))
