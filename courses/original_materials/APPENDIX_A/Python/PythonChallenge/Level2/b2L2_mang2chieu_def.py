def create_multilist(rowNum, colNum):
    multilist = [[row * col for col in range(colNum)] for row in range(rowNum)]
    return multilist

input_str = input("Nhập X, Y: ")
dimensions = [int(x) for x in input_str.split(',')]
rowNum, colNum = dimensions

result = create_multilist(rowNum, colNum)
print(result)

#Viết một chương trình có 2 chữ số, X, Y nhận giá trị từ đầu vào và tạo ra một mảng 2 chiều. 
#Giá trị phần tử trong hàng thứ i và cột thứ j của mảng phải là i*j.

#Lưu ý: i=0,1,...,X-1; j=0,1,...,Y-1.

#Ví dụ: Giá trị X, Y nhập vào là 3,5 thì đầu ra là: [[0, 0, 0, 0, 0], [0, 1, 2, 3, 4], [0, 2, 4, 6, 8]]
