from fractions import Fraction
data = []
with open('TBC.INP', 'r') as file:
    for line in file:
        num = float(line)
        data.append(num)
    
    
with open('TBC.OUT', 'w') as file:
    for num in data:
        fraction = Fraction(num)
        s = str(fraction).split('/')
        file.write(s[1] + '\n')
        