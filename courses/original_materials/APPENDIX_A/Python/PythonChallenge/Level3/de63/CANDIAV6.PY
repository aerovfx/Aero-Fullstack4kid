# Đọc dữ liệu từ file CANDIA.INP
with open("CANDIA.INP", "r") as f:
    n = int(f.readline())
    weights = list(map(int, f.readline().split()))

# Tính số cách xếp n quả cân thoả mãn
def count_arrangements(n, weights):
    dp = [[[0] * (sum(weights) // 2 + 1) for _ in range(sum(weights) // 2 + 1)] for _ in range(n + 1)]
    dp[0][0][0] = 1

    for i in range(1, n + 1):
        for left in range(sum(weights) // 2 + 1):
            for right in range(sum(weights) // 2 + 1):
                dp[i][left][right] = dp[i - 1][left][right]
                if left >= weights[i - 1]:
                    dp[i][left][right] += dp[i - 1][left - weights[i - 1]][right]
                if right >= weights[i - 1]:
                    dp[i][left][right] += dp[i - 1][left][right - weights[i - 1]]

    return dp[n][sum(weights) // 2][sum(weights) // 2]

total_arrangements = count_arrangements(n, weights)

# Tạo và in các trường hợp thỏa mãn vào file CANDIA.OUT
arrangements = []

def find_arrangements(n, left, right, weights, arrangement):
    if n == 0:
        arrangements.append(arrangement)
        return
    if left >= weights[n - 1]:
        find_arrangements(n - 1, left - weights[n - 1], right, weights, arrangement + f"Trường hợp {n}: đặt quả cân {n} bên trái rồi quả cân {n} bên trái\n")
    if right >= weights[n - 1]:
        find_arrangements(n - 1, left, right - weights[n - 1], weights, arrangement + f"Trường hợp {n}: đặt quả cân {n} bên trái rồi quả cân {n} bên phải\n")

find_arrangements(n, sum(weights) // 2, sum(weights) // 2, weights, "")

# In số lượng cách xếp
with open("CANDIA.OUT", "w", encoding="utf-8") as f:
    f.write(f"{total_arrangements}\n")

# In các trường hợp thỏa mãn vào file CANDIA.OUT
with open("CANDIA.OUT", "a", encoding="utf-8") as f:
    for arrangement in arrangements:
        f.write(arrangement)
