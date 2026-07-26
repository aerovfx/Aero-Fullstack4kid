#Hàm:
def tim_chuoi_con(sequence):  #Hàm tìm chuỗi con liên tiếp sequence nghĩa là liên tiếp
    n = len(sequence)
    chuoi = []
    for i in range(n):
        for j in range(i+1,n+1):
            chuoi.append(sequence[i:j])
    return chuoi
#Dữ liệu vào từ file CHUOICON.INP:
with open("CHUOICON.INP","r") as file:
    sequence = file.read().strip().split(',')
#Chuyển các phần tử trong chuỗi thành số nguyên
#sequence = [int(num) for num in sequence]
#Loại bỏ dấu ngoặc vuông "[" và "]":
sequence = [num.strip('[').strip(']') for num in sequence]
#Tìm các chuỗi con
chuoi = tim_chuoi_con(sequence)
#Xuất kết quả vào file CHUOICON.OUT:
with open("CHUOICON.OUT","w") as file:
    for chuoicon in chuoi:
        file.write(','.join(map(str, chuoicon)) + '\n')



    