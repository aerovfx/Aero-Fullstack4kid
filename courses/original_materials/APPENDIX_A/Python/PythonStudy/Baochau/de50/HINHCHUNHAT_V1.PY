file = open('HINHCHUNHAT.INP')
file2 = open('HINHCHUNHAT.OUT', 'w')
n = int(file.readline())

danh_sachx = []
danh_sachy = []

result = 0
def check(a, b, c, d):
    x1 = danh_sachx[a]
    y1 = danh_sachy[a]
    x2 = danh_sachx[b]
    y2 = danh_sachy[b]
    x3 = danh_sachx[c]
    y3 = danh_sachy[c]
    x4 = danh_sachx[d]
    y4 = danh_sachy[d]
    
    if x1 == x2 and y1 != y2:
        if x3 == x4 and y3 != y4:
            if (y1 == y3 and y2 == y4) or (y2 == y3 and y1 == y4):
                return True
            
    elif x1 == x3 and y1 != y3:
        if x2 == x4 and y2 != y4:
            if (y1 == y2 and y3 == y4) or (y2 == y3 and y1== y4):
                return True
            
    elif x1 == x4 and y1 != y4:
        if x2 == x3 and y2 != y3:
            if (y1 == y2 and y3 == y4) or (y1 == y3 and y2 == y4):
                return True
    else:
        return False
    
for i in range(n):
    td = file.readline()
    td = td.split()
    danh_sachx.append(int(td[0]))
    danh_sachy.append(int(td[1]))

   
for i1 in range(n-3):
    for i2 in range(i1 + 1, n-2):
        for i3 in range(i2 + 1, n-1):
            for i4 in range(i3+1, n):
                if check(i1, i2, i3, i4):
                    result += 1
            
file2.write(str(result))

file.close()
file2.close()