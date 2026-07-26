# Các lệnh thao tác với danh sách
loaihoa = ["hong","hue","layon","loaken","nhai"]
loaihoamoi =["lan","doquyen","mua","sim","muongbien"]
loaihoamoi = (" ".join(loaihoamoi))

print(loaihoa)

count = 1
for x in loaihoa:
    #print("Cac loai hoa la : " + x)

    print("hoa thu nhat " + str(count)+ " is: " + x)
    count += 1