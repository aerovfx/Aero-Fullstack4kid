def trau_an_co():
    for x in range(1,100):
        for y in range(1,100):
            z = 100 - x - y
            if 5*x + 3*y + z/3 ==100 and x>0:
                return (x,y,z)
    return None

result = trau_an_co()
if result:
    print("So trau dung,trau nam,trau gia theo thu tu la:", result)
else:
    print("Khong tim thay ket qua.")

