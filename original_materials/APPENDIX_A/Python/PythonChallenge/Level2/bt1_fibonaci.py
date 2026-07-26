
"""
Bài 01: Viết một chương trình Python in ra dãy số Fibonacci

Gợi ý:

Sử dụng đệ quy
Không sử dụng đệ quy
Code mẫu: In dãy số Fibonacci trong Python không sử dụng đệ quy.
0
1
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28

 * Tính số fibonacci thứ n
 *
 * @param n: chỉ số của số fibonacci tính từ 0
 *           vd: F0 = 0, F1 = 1, F2 = 1, F3 = 2
 * @return số fibonacci thứ n

"""

def fibonacci(n): #Ham fibonaci
    f0 = 0;
    f1 = 1;
    fn = 1;
  
    if (n < 0):
        return -1;
    elif (n == 0 or n == 1):
        return n;
    else:
        for i in range(2, n):
            f0 = f1;
            f1 = fn;
            fn = f0 + f1;
        return fn;
  
print("20 số đầu tiên của dãy số Fibonacci: ");
sb = "";
for i in range(0, 20):
    sb = sb + str(fibonacci(i)) + ", ";
print(sb)