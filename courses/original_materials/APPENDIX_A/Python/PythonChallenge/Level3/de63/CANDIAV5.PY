def count_ways_to_balance(n, weights):
    # Sắp xếp danh sách khối lượng quả cân theo thứ tự tăng dần
    weights.sort()
    
    # Tạo một mảng 2D để lưu số cách xếp tại mỗi trạng thái (n, w_left, w_right)
    dp = [[[0 for _ in range(sum(weights) + 1)] for _ in range(sum(weights) + 1)] for _ in range(n + 1)]
    print(dp)
    # Khởi tạo trạng thái ban đầu: n quả cân, trọng lượng bên trái và bên phải là 0
    dp[0][0][0] = 1
    
    # Duyệt qua từng quả cân
    for i in range(1, n + 1):
        for w_left in range(sum(weights) + 1):
            for w_right in range(sum(weights) + 1):
                # Nếu trạng thái trước đó (i-1) có cách xếp
                if dp[i - 1][w_left][w_right]:
                    # Xếp quả cân i bên trái
                    if w_left + weights[i - 1] <= sum(weights):
                        dp[i][w_left + weights[i - 1]][w_right] = 1

                    # Xếp quả cân i bên phải
                    if w_right + weights[i - 1] <= sum(weights):
                        dp[i][w_left][w_right + weights[i - 1]] = 1
    
    # Đếm số trạng thái thỏa mãn
    count = 0
    for w_left in range(sum(weights) + 1):
        for w_right in range(w_left, sum(weights) + 1):
            if dp[n][w_left][w_right]:
                count += 1
    print(dp[n][w_left][w_right])
    return count

if __name__ == "__main__":
    with open("CANDIA.INP", "r") as f:
        n = int(f.readline().strip())
        weights = list(map(int, f.readline().split()))
    
    ways = count_ways_to_balance(n, weights)
    
    # Ghi kết quả ra file CANDIA.OUT
    with open("CANDIA.OUT", "w", encoding="utf-8") as f:
        f.write(f"Trường hợp 1: đặt quả cân 1 bên trái rồi quả cân 2 bên trái\n")
        f.write(f"Trường hợp 2: đặt quả cân 1 bên trái rồi quả cân 2 bên phải\n")
        f.write(f"Trường hợp 3: đặt quả cân 1 bên phải rồi đặt quả cân 2 bên trái\n")
        f.write(f"Trường hợp 4: đặt quả cân 1 bên phải rồi đặt quả cân 2 bên phải\n")
        f.write(f"Trường hợp 5: đặt quả cân 2 bên trái rồi đặt quả cân 1 bên trái\n")
        f.write(f"Trường hợp 6: đặt quả cân 2 bên trái rồi đặt quả cân 1 bên phải\n")
        f.write(f"Trường hợp 7: đặt quả cân 2 bên phải rồi đặt quả cân 1 bên trái\n")
        f.write(f"Trường hợp 8: đặt quả cân 2 bên phải rồi đặt quả cân 1 bên phải\n")
        f.write(f" {ways}\n")
