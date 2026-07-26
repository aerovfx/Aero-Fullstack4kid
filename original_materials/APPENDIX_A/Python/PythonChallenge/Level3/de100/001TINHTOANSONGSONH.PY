def calculate_time(expression, P, Q):
    if len(expression) == 1:  # Nếu chỉ có một biến
        return 0
    time = []
    for i in range(len(expression)):
        if expression[i] == '+':
            time.append(calculate_time(expression[:i], P, Q) + calculate_time(expression[i + 1:], P, Q) + P)
        elif expression[i] == '*':
            time.append(calculate_time(expression[:i], P, Q) + calculate_time(expression[i + 1:], P, Q) + Q)
    if not time:  # Kiểm tra danh sách thời gian có rỗng hay không
        return 0
    return max(time)

def transform_expression(expression):
    transformed_expression = expression
    transformed_expression = transformed_expression.replace(')+(', ')^(')
    transformed_expression = transformed_expression.replace(')*(', ')*(')
    transformed_expression = transformed_expression.replace('+*', '*')
    transformed_expression = transformed_expression.replace('*+', '+')
    return transformed_expression

# Đọc dữ liệu từ file PO.INP
with open('PO.INP', 'r') as file:
    P, Q = map(int, file.readline().split())
    expressions = [line.strip() for line in file]

# Tính thời gian và biến đổi biểu thức cho từng biểu thức trong danh sách
results = []
for expression in expressions:
    time = calculate_time(expression, P, Q)
    transformed_expression = transform_expression(expression)
    transformed_time = calculate_time(transformed_expression, P, Q)
    results.append((time, transformed_expression, transformed_time))

# Ghi kết quả ra file PO.OUT
with open('PO.OUT', 'w') as file:
    for result in results:
        time, transformed_expression, transformed_time = result
        file.write(f"{time}\n")
        file.write(f"{transformed_expression}\n")
        file.write(f"{transformed_time}\n")
