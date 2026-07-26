def catday(n):
    dem = 0
    for a in range(1,n):
        b = n-2*a
        if (a<b) and (a*2>b):
            dem += 1
            print(a,a,b)
    return dem

with open('CATDAY.INP', 'r') as file:
    lines = file.readlines()



with open('CATDAT.OUT', 'w') as file:
    for line in lines:
        n = int(line.strip())
        dem = catday(n)
        file.write(str(dem) + '\n')