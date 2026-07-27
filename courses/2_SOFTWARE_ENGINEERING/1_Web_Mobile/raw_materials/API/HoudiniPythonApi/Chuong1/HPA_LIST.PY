# Các lệnh thao tác với danh sách
loaihoa = ["hong","hue","layon","loaken","nhai"]
#in danh sách đầy đủ
print(loaihoa)
#in phần tử thứ 2 từ bên phải của danh sách 
print(loaihoa[-2])
#in ra 2 phần từ kể từ phần tử đầu tiên bên trái
print(loaihoa[:2])
#in ra 2 phần từ kể từ phần tử thứ 2 bên phải
print(loaihoa[:-2])
#Xoá bỏ một phần tử
loaihoa.remove("layon")
#Xoá bỏ một phần tử
loaihoa.remove(loaihoa[1])

postion = loaihoa.index("hong")
print("Hoa hong la phan tu ", postion)

count = 1
for x in loaihoa:
    print("Cac loai hoa la : " + x)

    #print("hoa: " + str(count)+ " is: " + x)
    #count += 1
loaihoa.append("camtucau")
loaihoa.append("phuong")
#print(loaihoa)
loaihoamoi =["lan","doquyen","mua","sim","muongbien"]
loaihoa.append(loaihoamoi)
#print(loaihoa)
#in ra loai hoa co vi tri dau tien va in ky tu dau tien ben phai
print(loaihoa[0][-1])

# Các lệnh
loaihoa = ("/".join(loaihoamoi))
print(loaihoa)
print(loaihoa.split("/"))