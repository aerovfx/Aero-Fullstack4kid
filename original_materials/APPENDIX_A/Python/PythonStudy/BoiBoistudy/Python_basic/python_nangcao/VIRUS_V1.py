with open('VIRUS.INP','r') as file:
    s = file.readline()
    print(s)
def tim_cum_tu(s):
    c = s.count('C')
    o = s.count('O')
    r = s.count('R')
    a = s.count('A')
    n = s.count('N')
    temp = min(c,r,a,n)
    if 2*temp <= 0:
        kq = temp
    else:
        kq = int(0/2)
    return kq
kq = tim_cum_tu(s)
with open('VIRUS.OUT','w') as file:
    file.write(str(kq))
    