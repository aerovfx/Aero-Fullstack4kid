def choose_gifts(gifts, curr_idx, curr_value, k, chosen_gifts):
    global max_gifts

    # Kiểm tra điều kiện dừng
    if curr_idx >= len(gifts):
        # Nếu số lượng phần quà được chọn vượt quá max_gifts, cập nhật max_gifts và danh sách phần quà được chọn
        if len(chosen_gifts) > max_gifts:
            max_gifts = len(chosen_gifts)
            chosen_gifts_copy = chosen_gifts.copy()
            all_chosen_gifts.append(chosen_gifts_copy)
        return

    # Chọn phần quà hiện tại
    if curr_value <= gifts[curr_idx]:
        chosen_gifts.append(gifts[curr_idx])
        choose_gifts(gifts, curr_idx + 1, gifts[curr_idx], k, chosen_gifts)
        chosen_gifts.pop()

    # Không chọn phần quà hiện tại
    if max_gifts + len(gifts) - curr_idx > k:
        choose_gifts(gifts, curr_idx + 1, curr_value, k, chosen_gifts)


# Đọc dữ liệu từ file GIFT.INP
with open('GIFT.INP', 'r') as file:
    data = file.readlines()

N, K = map(int, data[0].split())
A = list(map(int, data[1:]))

max_gifts = 0
chosen_gifts = []
all_chosen_gifts = []
choose_gifts(A, 0, 0, K, chosen_gifts)

# Ghi kết quả ra file GIFT.OUT
with open('GIFT.OUT', 'w') as file:
    file.write(str(max_gifts) + '\n')
    for chosen_gifts in all_chosen_gifts:
        file.write(' '.join(map(str, chosen_gifts)) + '\n')
