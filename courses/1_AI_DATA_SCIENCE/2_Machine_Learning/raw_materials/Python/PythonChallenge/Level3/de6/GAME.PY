def min_energy_cost(N, K, h):
    dp = [float('inf')] * N
    dp[0] = 0

    for i in range(1, N):
        for j in range(1, K+1):
            if i - j >= 0:
                dp[i] = min(dp[i], dp[i-j] + abs(h[i] - h[i-j]))

    return dp[N-1]

# Đọc dữ liệu từ file GAME.INP
with open("GAME.INP", "r") as file:
    data = file.readlines()

N, K = map(int, data[0].split())
h = list(map(int, data[1].split()))

# Tính toán kết quả
result = min_energy_cost(N, K, h)

# Ghi kết quả vào file GAME.OUT
with open("GAME.OUT", "w") as file:
    file.write(str(result))
