def cat_day(n):
    dem = 0
    for a in range(1,n //2 +1):
        b = n-2*a
        
        if (a*2 > b) and (a<b):
            dem +=1
            print(a,a,b)
       
    return dem
    

with open('CATDAY.INP','r') as file:
    lines = file.readlines()



with open('CATDAY.OUT','w') as file:
    for line in lines:
        n = int(line.strip())
        dem = cat_day(n)
        file.write(str(dem) + '\n')