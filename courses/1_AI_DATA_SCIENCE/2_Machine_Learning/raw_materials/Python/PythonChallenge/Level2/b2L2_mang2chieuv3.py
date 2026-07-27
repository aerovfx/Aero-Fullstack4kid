#tao ham
def create_multilist(rowNum, colNum):
    multilist = [[row * col for col in range(colNum)] for row in range(rowNum)]
    return multilist

#gán input và output file
input_file = 'b2L2_MANG2CHIEU.INP'
output_file = 'b2L2_MANG2CHIEU.OUT'

#mở file input và đọc từng dòng lệnh, với x,y thì gọi hàm create_multilist và ghi vào biến tên là results
with open(input_file, 'r') as file:
    lines = file.readlines()

results = []

for line in lines:
    dimensions = [int(x) for x in line.strip().split(',')]
    rowNum, colNum = dimensions
    result = create_multilist(rowNum, colNum)
    results.append(result)

#mở file output và ghi kết quả
with open(output_file, 'w') as file:
    for result in results:
        for row in result:
            file.write(','.join(map(str, row)) + '\n')
        file.write('\n')


