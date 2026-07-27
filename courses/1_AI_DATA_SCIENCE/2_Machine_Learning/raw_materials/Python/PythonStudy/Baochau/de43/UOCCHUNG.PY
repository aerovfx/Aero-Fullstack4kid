def tim_ptu(n):
    if n == 1:
        gt=1
    else:
        num =  tim_ptu(n-1)
        gt = num + n-1
    return gt
with open('Cstn.INP','r') as file:
    n = int(file.readline().strip())
kq = tim_ptu(n)
with open('Cstn.OUT','w') as file:
    file.write(str(kq)) 
    