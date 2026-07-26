points = []
with open('HINHCHUNHAT.INP', 'r') as f:
    n = int(f.readline().strip())  # Đọc số lượng điểm N
    for _ in range(n):
        x, y = map(int, f.readline().strip().split())  # Đọc tọa độ x, y của điểm
        print(points)
def hcn(x,y):
    # Với mỗi cặp, ta kiểm tra các giá trị lớn nhất và nhỏ nhất của x,y
    for i in range(x,y):
        if i == 0:
            minx = x
            maxx = x
            miny = y
            maxy = y
        else:
            if minx > x:
                minx = x
            if maxx < x:
                maxx = x
            if miny > y:
                miny = y
            if maxy < y:
                maxy = y
            a = maxx - minx + 2
            b = maxy - miny + 2
            c = a*b
    return c

result = hcn(x,y)
with open('HINHCHUNHAT.OUT', 'w') as file:
    file.write(str(result))