from array import *
from math import *
file = open('SONT.INP')
file2 = open('SONT.OUT', 'w')
def nguyento(num):
    if num == 1:
        return False
    else:
        for i in range(2, int(sqrt(num)+1)):
            if num % i == 0: 
                return False
        return True
    
n = int(file.readline())
s = file.readline()
data = s.split()
dem = array('i')

m = int(data[0])
for i in range(1,n):
    if m<int(data[i]): 
        m == int(data[i])   
        
for i in range(m+i):
    dem.append(0)
for i in range(n):
    a = int(data[i])
    if nguyento(a) : 
        dem[a] += 1 
        
m = max(dem)

if m == 0: 
    file2.write('khong tim duoc')
else:
    file2.write(str(dem.index(m)) + '' + str(m))
    
file.close()
file2.close()