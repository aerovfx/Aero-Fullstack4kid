file = open('HCN.INP')
file2 = open('HCN.OUT','w')
n = int(file.readline())
x = []
y = []
kq = 0
#Ham
def ktra(a, b, c, d):
    x1 = x[a]
    x2 = x[b]
    x3 = x[c]
    x4 = x[d]
    y1 = y[a]
    y2 = y[b]
    y3 = y[c]
    y4 = y[d]
    #TH1 & 2:
    if x1 == x2 and y1 != y2:
        if x3 == x4 and y3 != y4:
            if (y1 == y3 and y2 == y4) or (y2 == y3 and y1 == y4):
                return True
    #TH3 & 4:
    elif x1 == x3 and y1 != y3:
        if x2 == x4 and y2 != y4:
            if (y1 == y2 and y3 == y4) or (y2 == y3 and y1 == y4):
                return True
    #TH5 & 6:
    elif x1 == x4 and y1 != y4:
        if x2 == x3 and y2 != y3:
            if (y1 == y2 and y3 == y4) or (y1 == y3 and y2 == y4):
                return True
    else:
        return False
    
for i in range(n):
    dt = file.readline()
    dt = dt.split()
    x.append(int(dt[0]))
    y.append(int(dt[1]))
    
for i1 in range(n-3):
    for i2 in range(i1+1, n-2):
        for i3 in range(i2+1, n-1):
            for i4 in range(i3+1, n):
                if ktra(i1, i2, i3, i4):
                    kq += 1
file2.write(str(kq))
file.close()
file2.close()