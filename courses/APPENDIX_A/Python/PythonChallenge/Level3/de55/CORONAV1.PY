file = open("CORONA.INP")
file2 = open("CORONA.OUT", "w")

s = file.readline()

c = s.count("C")
o = s.count("O")
r = s.count("R")
n = s.count("N")
a = s.count("A")

temp = min(c, r, n, a)
if 2*temp <= 0:
    kq = temp
else:
    kq = int(o/2)
    
print(kq)
file2.write(str(kq))

file.close()
file2.close()