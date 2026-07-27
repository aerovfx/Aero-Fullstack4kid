file = open('DOIHUONG.INP')
file2 = open('DOIHUONG.OUT','w')
kq = []
for test in range(10):
    s = file.readline()

    s1 = list(s)
    kq.clear()
    for i in range(len(s)):
        if s1[i] == 2:
            s1[i] = 3
        elif s1[i] == 3:
            s1[i] = 2
    for huong in range(1, 5):
        dem = 0
        for i in range(len(s) - 1):
            temp = abs(huong - int(s1[i]))
            if temp > 2:
                temp = 1
            dem += temp
        if huong == 1 :
            tong = dem
            kq.append(huong)
        elif tong > dem:
            kq.clear()
            tong = dem
            kq.append(huong)
        elif tong == dem:
            kq.append(huong)
    for i in range(len(kq)):
        if kq[i] == 2:
            kq[i] = 3
        elif kq[i] == 3:
            kq[i] = 2
    temp = ' '.join([str(i) for i in kq])
    if test < 9:
        file2.write(temp +'\n' + str(tong) + '\n')
    else:
        file2.write(temp + '\n' + str(tong))
    print(temp)
    print(tong)
file.close()
file2.close()