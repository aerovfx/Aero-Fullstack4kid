def choose_gifts(gifts, curr_idx, curr_value, k, chosen_gifts):
    # Kiểm tra điều kiện dừng
    if curr_idx >= len(gifts):
        # In danh sách các phần quà được chọn
        print(chosen_gifts)
        return

    # Chọn phần quà hiện tại
    if curr_value <= gifts[curr_idx]:
        chosen_gifts.append(gifts[curr_idx])
        choose_gifts(gifts, curr_idx + 1, gifts[curr_idx], k, chosen_gifts)
        chosen_gifts.pop()

    # Không chọn phần quà hiện tại
    if len(gifts) - curr_idx > k:
        choose_gifts(gifts, curr_idx + 1, curr_value, k, chosen_gifts)


# Dữ liệu đầu vào
N = 5
K = 2
A = [4, 5, 6, 4, 8]

chosen_gifts = []
choose_gifts(A, 0, 0, K, chosen_gifts)
