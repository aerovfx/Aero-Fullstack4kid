# in ra kết quả x và y
with open('CATDAY.INP', 'r') as file:
    n = int(file.read())
    
def catday(n):
    dem = 0
    for a in range(1,n):
        b = n-2*a
        if (a<b) and (a*2>b):
            dem += 1
            print(a,a,b)
    return a,a,b

result = catday(n)

with open('CATDAT.OUT', 'w') as file:
    file.write(str(result) )