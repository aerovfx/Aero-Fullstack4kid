with open('HINHCHUNHAT.INP', 'r') as file:
    p = float(file.read())    
#create rectangle analysis function
def dien_tich_hinh_chu_nhat(p):
    a = p /4
    s = a **2
    return round(s, 2)

result = dien_tich_hinh_chu_nhat(p)
with open('HINHCHUNHAT.OUT', 'w') as file:
    file.write(str(result))