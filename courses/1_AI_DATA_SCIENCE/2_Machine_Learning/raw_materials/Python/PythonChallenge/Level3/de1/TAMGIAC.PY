def calculate_triangle_area(a, b, c):
    if a * a == b * b + c * c or b * b == a * a + c * c or c * c == a * a + b * b:
        area = (a * b) / 2
        return round(area, 1)
    else:
        return -1

with open("TAMGIAC.INP", "r") as file_input, open("TAMGIAC.OUT", "w") as file_output:
    lines = file_input.readlines()  # Đọc từng dòng dữ liệu từ file input
    results = []

    for line in lines:
        a, b, c = map(int, line.split())
        area = calculate_triangle_area(a, b, c)
        results.append(str(area))

    file_output.write("\n".join(results))  # Ghi kết quả vào file output, mỗi kết quả trên một dòng
