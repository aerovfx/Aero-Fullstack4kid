with open('CATDAY.INP','r') as file:
    n = int(file.read())


def cat_day(n):
    dem = 0
    for a in range(1,n):
        b = n-2*a
        
        if (a*2 > b) and (a<b):
            dem +=1
            print(a,a,b)
       
    return dem
kq = cat_day(n)
with open('CATDAY.OUT','w') as file:
    file.write(str(kq))
