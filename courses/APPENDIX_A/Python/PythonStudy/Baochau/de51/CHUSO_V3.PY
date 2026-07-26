def chuso_cuoicung(m,n,k):
    result = 1
    while n > 0:
        if n%2 == 1:
            result = (result*m) % k
        m = (m*m) % k
        n //= 2
    return result

with open("CHUSO.INP", 'r') as file:
    lines = file.readline()
output_line = [ 
               f'{chuso_cuoicung(m,n,10**k):0{k}}' + '\n'
               for m,n,k in [map(int, line.split()) for line in lines] ]

with open('CHUSO.OUT', 'w') as file:
    file.writelines(output_line)