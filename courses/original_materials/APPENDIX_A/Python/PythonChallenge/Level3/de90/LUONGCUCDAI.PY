def input_data():
    input_file = 'Input.Txt'
    with open(input_file, 'r') as file:
        m, n = map(int, file.readline().split())  # Đọc số hàng (m) và số cột (n)
        p = list(map(int, file.readline().split()))  # Đọc mảng p
        a = []
        for _ in range(m):
            row = list(map(int, file.readline().split()))  # Đọc mảng 2 chiều a
            a.append(row)
    s = m + 1  # Đánh dấu nút s là hàng thêm vào cuối mảng a
    t = n + 1  # Đánh dấu nút t là cột thêm vào cuối mảng a
    a.insert(0, p)  # Thêm hàng p vào đầu mảng a
    return m, n, s, t, a


def find_path(m, n, s, t, a, x, trace_x, trace_y):
    queue = []  # Queue để lưu trạng thái duyệt BFS
    first = 0  # Vị trí đầu queue
    last = -1  # Vị trí cuối queue
    for i in range(1, m + 1):
        if x[s][i] < a[s][i]:  # Nếu cạnh chưa bão hòa
            last += 1
            queue.append(i)  # Thêm đỉnh vào queue
            trace_x[i] = -1  # Ghi nhận đỉnh trước đỉnh i trong đường đi tăng luồng

    while first <= last:
        i = queue[first]  # Lấy đỉnh đầu tiên trong queue
        first += 1
        for j in range(1, n + 1):
            if trace_y[j] == 0 and x[i][j] < a[i][j]:  # Nếu đỉnh chưa được duyệt và cạnh chưa bão hòa
                trace_y[j] = i  # Ghi nhận đỉnh trước đỉnh j trong đường đi tăng luồng
                if x[j][t] < a[j][t]:  # Nếu đỉnh j là đỉnh t và cạnh chưa bão hòa
                    return True, j  # Tìm được đường đi tăng luồng

                for v in range(1, m + 1):
                    if trace_x[v] == 0 and x[v][j] > 0:  # Nếu đỉnh chưa được duyệt và cạnh còn trống
                        last += 1
                        queue.append(v)  # Thêm đỉnh vào queue
                        trace_x[v] = j  # Ghi nhận đỉnh trước đỉnh v trong đường đi tăng luồng

    return False, None  # Không tìm được đường đi tăng luồng


def min_value(x, y):
    return x if x
