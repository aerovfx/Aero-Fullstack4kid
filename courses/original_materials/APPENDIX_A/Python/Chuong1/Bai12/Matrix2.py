# Ma trận đường đi: Sử dụng danh sách 2 chiều để lưu trữ thông tin về đồ thị đường đi giữa các đỉnh. Mỗi phần tử trong danh sách 2 chiều đại diện cho một cạnh giữa hai đỉnh. Điều này cho phép chúng ta tìm kiếm đường đi ngắn nhất, tìm chu trình Euler, và thực hiện các thuật toán khác liên quan đến đồ thị.
# sử dụng danh sách 2 chiều để lưu trữ thông tin về đồ thị đường đi và tìm đường đi ngắn nhất bằng thuật toán Dijkstra:
import sys

# Định nghĩa một đồ thị bằng danh sách 2 chiều
graph = [
    [0, 2, 4, 0, 0, 0],
    [2, 0, 1, 4, 2, 0],
    [4, 1, 0, 0, 3, 0],
    [0, 4, 0, 0, 3, 2],
    [0, 2, 3, 3, 0, 2],
    [0, 0, 0, 2, 2, 0]
]

# Hàm tìm đường đi ngắn nhất từ nguồn đến đích bằng thuật toán Dijkstra
def dijkstra(graph, source, destination):
    num_vertices = len(graph)
    visited = [False] * num_vertices  # Mảng để lưu trạng thái đã thăm của các đỉnh
    distances = [sys.maxsize] * num_vertices  # Mảng để lưu khoảng cách từ nguồn đến các đỉnh
    distances[source] = 0  # Khoảng cách từ nguồn đến chính nó là 0

    for _ in range(num_vertices):
        # Tìm đỉnh có khoảng cách nhỏ nhất và chưa được thăm
        min_distance = sys.maxsize
        min_vertex = -1
        for v in range(num_vertices):
            if not visited[v] and distances[v] < min_distance:
                min_distance = distances[v]
                min_vertex = v

        # Đánh dấu đỉnh hiện tại đã được thăm
        visited[min_vertex] = True

        # Cập nhật khoảng cách của các đỉnh kề
        for v in range(num_vertices):
            if not visited[v] and graph[min_vertex][v] > 0:
                new_distance = distances[min_vertex] + graph[min_vertex][v]
                if new_distance < distances[v]:
                    distances[v] = new_distance

    return distances[destination]

# Chạy thuật toán Dijkstra để tìm đường đi ngắn nhất từ đỉnh 0 đến đỉnh 5
source = 0
destination = 5
shortest_distance = dijkstra(graph, source, destination)
print(f"Đường đi ngắn nhất từ đỉnh {source} đến đỉnh {destination}: {shortest_distance}")
