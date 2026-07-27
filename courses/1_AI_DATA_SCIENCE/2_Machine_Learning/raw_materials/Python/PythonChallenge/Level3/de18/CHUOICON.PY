def tim_chuoi_con(sequence): #ham tim chuoi con lien tiep squence nghia la lien tiep
    n = len(sequence)
    chuoi = []
    for i in range(n):
        for j in range(i+1, n+1):
            chuoi.append(sequence[i:j])
    return chuoi

# Đọc chuỗi từ file CHUOICON.INP
with open('CHUOICON.INP', 'r') as file:
    sequence = file.read().strip().split(',')

# Chuyển các phần tử trong chuỗi thành số nguyên
sequence = [int(num) for num in sequence]

# Loại bỏ dấu ngoặc vuông "[" và "]"
#sequence = [num.strip('[').strip(']') for num in sequence]

# Tìm các chuỗi con
chuoi = tim_chuoi_con(sequence)

# Ghi các chuỗi con vào file CHUOICON.OUT
with open('CHUOICON.OUT', 'w') as file:
    for chuoicon in chuoi:
        file.write(','.join(map(str, chuoicon)) + '\n')
