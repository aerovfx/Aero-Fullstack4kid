def doi_tien():
    with open('DOITIEN.INP', 'r') as file:
        n = int(file.readline())
        x = int(file.readline())
        y = int(file.readline())
        z = int(file.readline())

    results = []  # Danh sách kết quả

    for i in range(n // x + 1):
        for j in range(n // y + 1):
            for h in range(n // z + 1):
                if i * x + j * y + h * z == n:
                    results.append((i, j, h))

    with open('DOITIEN.OUT', 'w') as file:
        file.write('CHUONG TRINH DOI TIEN:\n')
        file.write(f'Nhap so tien can doi n = {n}\n')
        file.write(f'Nhap loai tien thu 1: {x}\n')
        file.write(f'Nhap loai tien thu 2: {y}\n')
        file.write(f'Nhap loai tien thu 3: {z}\n')
        file.write(f'Loai{x:6}  Loai{y:6}   Loai{z:6}\n')

        for result in results:
            file.write(f'{result[0]:8}{result[1]:12}{result[2]:10}\n')

    print('Da ghi ket qua vao file DOITIEN.OUT')

doi_tien()