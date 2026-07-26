def input_data():
    input_file = 'PICTURE.INP'
    with open(input_file, 'r') as file:
        n, m = map(int, file.readline().split())
        c = list(map(int, file.readline().split()))
        v = []
        for _ in range(n):
            row = list(map(int, file.readline().split()))
            v.append(row)
    return n, m, c, v


def max_beauty(n, m, c, v):
    dp = [[0] * (m + 1) for _ in range(n + 1)]
    path = [[0] * (m + 1) for _ in range(n + 1)]

    for i in range(1, n + 1):
        dp[i][i] = dp[i - 1][i - 1] + c[i - 1]

    for i in range(1, n + 1):
        for j in range(i + 1, m + 1):
            dp[i][j] = max(dp[i][j - 1], dp[i - 1][j - 1] + v[i - 1][j - 1])
            if dp[i][j] == dp[i][j - 1]:
                path[i][j] = path[i][j - 1]
            else:
                path[i][j] = i

    max_beauty = dp[n][m]
    door = path[n][m]
    positions = [str(i) for i in range(1, door)] + [str(i) for i in range(door + 1, n + 1)]

    return max_beauty, door, positions


def output_data(max_beauty, door, positions):
    output_file = 'PICTURE.OUT'
    with open(output_file, 'w') as file:
        file.write(str(max_beauty) + '\n')
        file.write(str(door) + '\n')
        file.write(' '.join(positions) + '\n')


n, m, c, v = input_data()
max_beauty, door, positions = max_beauty(n, m, c, v)
output_data(max_beauty, door, positions)
