# Các lệnh thao tác với danh sách
loaihoa = ["hong","hue","layon","loaken","nhai"]
loaihoa_nhom1 = []
loaihoa_nhom2 = []


count = 1
for x in loaihoa:
    if count >= 4:
        loaihoa_nhom1.append(x)
    else:
        loaihoa_nhom2.append(x)
    count += 1
print(loaihoa_nhom1)
print(loaihoa_nhom2)
