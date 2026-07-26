def solve_cows_problem():
    for x in range(1, 101):
        for y in range(1, 101):
            z = 100 - x - y
            if 14*x + 8*y == 200 and z >= 0:
                return (x, y, z)
    return None

result = solve_cows_problem()

if result:
    print("Số trâu đứng, trâu nằm, trâu già theo thứ tự là:", result)
else:
    print("Không tìm thấy kết quả.")
