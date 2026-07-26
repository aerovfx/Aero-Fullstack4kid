def xau(xau1, xau2):
    xau2 = set(xau2)
    for i in xau1:
        if i not in xau2:
            return False
        else:
            return True
        
xau1 = input('nhập vào xâu 1: ')
xau2 = input('nhập vào xâu 2: ')

result = xau(xau1, xau2)
if result:
    print('xâu thứ nhất có toàn bộ kí tự trong xâu thứ 2')
else:
    print('xâu thứ nhất ko chứa toàn bộ kí tự trong xâu thứ 2')