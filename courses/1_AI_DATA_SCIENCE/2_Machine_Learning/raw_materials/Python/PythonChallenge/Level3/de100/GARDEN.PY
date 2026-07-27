def max_beauty(n, L, trees):
    # Tính toán độ tươi tối đa mà mỗi cây có thể đạt được khi tưới L lít nước vào cây đó
    max_freshness = [a + b * L for a, b in trees]
    # Sắp xếp các cây theo thứ tự giảm dần của max_freshness
    sorted_trees = sorted(trees, key=lambda x: x[0] + x[1] * L, reverse=True)

    # Tiến hành tưới nước và tính toán vẻ đẹp của khu vườn sau mỗi lần tưới
    beauty = 0
    for i in range(n):
        water = min(L, (max_freshness[i] - sorted_trees[i][0]) // sorted_trees[i][1])
        beauty = max(beauty, sorted_trees[i][0] + water * sorted_trees[i][1])

    return beauty

# Đọc dữ liệu từ file input
with open("GARDEN.INP", "r") as f:
    n, L = map(int, f.readline().split())
    trees = [list(map(int, f.readline().split())) for _ in range(n)]

# Tính toán vẻ đẹp lớn nhất của khu vườn và ghi kết quả vào file output
result = max_beauty(n, L, trees)
with open("GARDEN.OUT", "w") as f:
    f.write(str(result) + "\n")
