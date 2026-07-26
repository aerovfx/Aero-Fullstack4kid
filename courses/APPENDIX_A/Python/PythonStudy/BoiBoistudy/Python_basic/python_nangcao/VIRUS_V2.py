with open('VIRUS.INP','r') as file:
    s = file.readlines()
def tim_cum_tu(s):
    C = s.count('C')
    O = s.count('O')
    R = s.count('R')
    O = s.count('O')
    A = s.count('A')
    N = s.count('N')
    temp = min(C,R,A,N)
    if 2*temp <= O:
        kq = temp
    else:
        kq = O/2
    return kq
with open('VIRUS.OUT','w') as file:  
    for line in s:
        s = line.strip()
        dem = tim_cum_tu(s)
        file.write(str(dem) + '\n')
