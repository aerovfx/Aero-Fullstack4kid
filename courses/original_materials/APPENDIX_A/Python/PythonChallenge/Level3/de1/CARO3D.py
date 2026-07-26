f_in = open("CARO3D.INP", "r");
f_out = open("CARO3D.OUT", "w");
#DOc mang 2 chieu tu tep
a = []
for i in range(0,6):
    a.append([])
    line = f_in.readline().split()
    for x in line: a[i].append(int(x))
#dem theo chieu ngang
dem = [0,0]; win = [0,0]
for i in range(0,6):
    for j in range(0,7):
        if a[i][j] == 0:
            dem[0] = dem[0] + 1
            dem[1] = 0
            if dem[0] == 4: win[0] = win[0] + 1
        else:
            dem[1] = dem[1] + 1
            dem[0] = 0
            if dem[1] == 4: win[1] = win[1] + 1
    dem[0] = 0; dem[1] = 0;
#dem theo chieu doc
dem = [0,0]
for j in range(0,7):
    for i in range(0,6):
        if a[i][j] == 0:
            dem[0] = dem[0] + 1
            dem[1] = 0
            if dem[0] == 4: win[0] = win[0] + 1
        else:
            dem[1] = dem[1] + 1
            dem[0] = 0
            if dem[1] == 4: win[1] = win[1] + 1
    dem[0] = 0; dem[1] = 0;
if (win[0]!=0 and win[1]!=0) or (win[0]==0 and win[1]==0): f_out.write("-1")
if (win[0]==0 and win[1]!=0): f_out.write("1")
if (win[1]==0 and win[0]!=0): f_out.write("0")
f_in.close(); f_out.close();