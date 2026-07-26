#Ham doc du lieu tu file:
def doc(file):
    point = []
    with open(file, 'r') as f:
        n = int(f.readline().strip())
        for _ in range(n):
            x,y = map(int, f.readline().strip().split())
            point.append((x,y))
    return point
#Ham dinh dang chuoi
# def hcn(rect):
#     return "HCN ("+";".join([f"({x}, {y})" for x,y in rect]) + ")"
#Ham tim hcn:
def tim(point):
    points_set = set(point)
    cn = set()
    for i in range(len(point)):
        for j in range(i+1, len(point)):
            x1,y1 = point[i]
            x2,y2 = point[j]
            if x1 != x2 and y1 != y2:
                if (x1,y2) in points_set and (x2,y1) in points_set:
                    rect = tuple(sorted(((x1,y1),(x2,y1),(x2,y2),(x1,y2))))
                    cn.add(rect)
    return len(cn)
# #Ham ghi kq vao file:
# def ghi_kq(cn, file):
#     with open(file,'w') as f:

        # for rect in cn:
        #     f.write(hcn(rect) + '\n')
#Doc du lieu tu file INP
point = doc('HCN.INP')
#Tim hcn thoa man
cn = tim(point)
#Doc du lieu tu file OUT
with open('HCN.OUT', 'w') as f:
    f.write(str(cn))