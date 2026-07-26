with open('CORONA.INP', 'r') as file:
    s = file.readlines()

def tim_cum_corona(s):
    C = s.count('C')
    O = s.count('O')
    R = s.count('R')
    O = s.count('O')
    N = s.count('N')
    A = s.count('A')

    temp = min(C, R, N, A)
    if temp*2 <= O:
        result = temp
    else:
        result = O/2
    return result

with open('CORONA.OUT', 'w') as file:   
    for line in s:
        s = line.strip()
        dem = tim_cum_corona(s)
        file.write(str(dem) + '\n') 