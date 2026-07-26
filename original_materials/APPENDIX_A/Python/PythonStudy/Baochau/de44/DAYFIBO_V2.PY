input_ = int(input('nhập vào một xâu: '))
def day_fibonaci(n):
    if len(n) < 3:
        return False
    if n[:2] != '01':
        return False
    
    
    a, b = 0, 1
    i = 2
    while i<len(n):
        tong = a + b
        if n[i:i + len(str(tong))] != str(tong):
            return False
        a, b = b, tong
        i += len(str(tong))
    return True

if day_fibonaci(input_): 
    print('đây là chuỗi fibo')
else:
    print('đây ko phải là chuỗi fibo')
    