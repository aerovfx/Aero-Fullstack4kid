file = open('DOIHUONG.INP')
file1 = open('DOIHUONG.OUT', 'w')

result = []
for test in range(10):
    n = file.readline().strip()

n1 = list(n)
result.clear()
# chuyển đổi các ký tự 2 trong n1 thành 3 và ngược lại
for i in range(len(n1)):
    if n1[i] == '2':
        n1[i] = '3'
    elif n[i] == '3':
        n1[i] = '2'

# tính số lần xoay với từng hướng từ 1-4:
for huong in range(1,5):
    dem = 0
    for i in range(len(n1)):
        temp = abs(huong - int(n[i]))
        if temp > 2:
            temp = 1
            dem += temp
        if huong == 1:
            tong = dem
            result.append(huong)
        elif tong > dem:
            result.clear()
            tong = dem
            result.append(huong)
        elif tong == dem:
            result.append(huong)
            
    # đổi hướng xoay 2 thành 3, 3 thành 2:
    for i in range(len(result)):
        if result[i] == 2:
            result[i] = 3
        elif result[i] == 3:
            result[i] = 2
                
        temp = ''.join([str(i) for i in result])
        if test < 9:
            file1.write(temp + '\n' + str(tong) + '\n')
        else:
            file1.write(temp + '\n' + str(tong))
file.close()
file1.close()