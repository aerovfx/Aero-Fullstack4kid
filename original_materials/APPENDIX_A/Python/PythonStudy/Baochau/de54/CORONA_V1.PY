with open('CORONA.INP', 'r') as file:
    s = file.read()
    print(s)
    
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

a = tim_cum_corona(s)
with open('CORONA.OUT', 'w') as file:
    file.write(str(a))