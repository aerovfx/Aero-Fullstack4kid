def min_training_time(n, m, k):
    # Tạo danh sách kỹ năng ban đầu
    skills = [0] * n
    trained_pokemon = []

    total_training_time = 0  # Tổng thời gian huấn luyện

    print("Danh sách các Pokemon với kỹ năng, cấp độ kỹ năng và thời gian huấn luyện:")

    # In thông tin của Pokemon đầu tiên ở cấp độ 0
    for j in range(1, n + 1):
        print(f"Pokemon 1: Kỹ năng {j} ở cấp độ 0, Thời gian huấn luyện: 0 giây")

    while len(trained_pokemon) < k - 1:  # Trừ đi 1 vì Pokemon đầu tiên đã in rồi
        for i in range(n):
            if skills[i] < m:
                
                # Tính thời gian huấn luyện cho Pokemon hiện tại
                training_time =
                total_training_time 

                # In thông tin của Pokemon
                for j in range(1, n + 1):
                    print(f"Pokemon {len(trained_pokemon) + 1}: Kỹ năng {j} ở cấp độ {skills[j - 1]}, Thời gian huấn luyện: {skills[j - 1] * (skills[j - 1] - 1) // 2} giây")

                # Nếu đã đủ số lượng Pokemon, thoát khỏi vòng lặp
                if len(trained_pokemon) >= k - 1:
                    break

    # In tổng thời gian huấn luyện tối thiểu
    print("Tổng thời gian huấn luyện tối thiểu là:", total_training_time, "giây")
total_time = min_training_time(n, m, k)
def main():
    # Đọc dữ liệu vào từ bàn phím hoặc file
    n = int(input("Nhập số kỹ năng (n): "))
    m = int(input("Nhập giới hạn cấp độ kỹ năng (m): "))
    k = int(input("Nhập số con Pokemon đặt hàng (k): "))

    # Gọi hàm
    min_training_time(n, m, k)

if __name__ == "__main__":
    main()
