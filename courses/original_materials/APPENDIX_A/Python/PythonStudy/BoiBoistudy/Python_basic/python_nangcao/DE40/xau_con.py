
def chuoi_xau(string):
    xau_con = []
    n = len(string)

    for i in range(n):
        for j in range(i+1, n+1):
            xau_con.append(string[i:j])
    return xau_con
string = 'abcdeefghi'
xau_con = chuoi_xau(string)
for xau in xau_con:
    print(xau_con)