with open('CANDIA.INP', 'r') as file:
    n = int(file.readline())
    weights = list(map(int, file.readline().split()))
    # print(n,weights)
    
def count_ways_to_balance_weights(weights):
    n = len(weights)
    # print(n)
    # Sắp xếp danh sách các quả cân theo thứ tự tăng dần
    weights.sort()
    
    # Tạo một mảng DP để lưu số cách xếp cho mỗi trạng thái (lượng trái, lượng phải, và chỉ số của quả cân đang xem xét)
    dp = [[[0 for _ in range(n + 1)] for _ in range(sum(weights) + 1)] for _ in range(2)]
    
    # Khởi tạo trạng thái ban đầu (không có quả cân)
    dp[0][0][0] = 1
    #dùng for in ra cách xếp
    # dùng so sánh weight left<= weight right
    
    return dp
# Tính và in ra kết quả
result = count_ways_to_balance_weights(weights)
print(result)