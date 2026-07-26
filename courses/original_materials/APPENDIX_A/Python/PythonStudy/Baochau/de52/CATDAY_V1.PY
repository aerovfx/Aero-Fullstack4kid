with open('CATDAY.INP', 'r') as file:
    n = int(file.read())
    
a = int(n/3)
b = int(n - (2*a))

def catday(n):
    dem = 0
    while (2*a) > b:
        if (a<b) and (a+2>b):
            dem += 1
        a -= 1
        b = n-2*a
    return dem

result = catday(n)
with open('CATDAT.OUT', 'w') as file:
    file.write(str(result))