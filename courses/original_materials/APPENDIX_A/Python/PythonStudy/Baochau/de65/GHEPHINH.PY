# Đọc dữ liệu từ tệp GHEPHCN.INP
with open('GHEPHINH.INP', 'r') as file:
    a1, b1 = map(int, file.readline().split())
    a2, b2 = map(int, file.readline().split())
    

# Tạo danh sách các chiều dài và chiều rộng của ba hình chữ Nhật
rectangles = [(a1, b1), (a2, b2)]
# print(rectangles)

def chieudai_rong_hcn(rectangles):
    lenght1 = a1
    lenght2 = a2
    width1 = b1
    width2 = b2
    if lenght1 == lenght2:
        width = width1 + width2
        lenght = lenght1
        hcn = lenght, width
    if width1 == width2:
        width = width1
        lenght = lenght1+lenght2
        hcn = lenght, width
    else:
        hcn = -1
    return hcn
result = chieudai_rong_hcn(rectangles)
print(result)