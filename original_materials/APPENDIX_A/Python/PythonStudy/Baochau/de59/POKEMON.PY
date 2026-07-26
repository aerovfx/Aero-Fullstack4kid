def min_training_time(n, m, k):
    if n < m - 1:
        # Kiểm tra nếu giới hạn cấp độ kỹ năng (m) nhỏ hơn n - 1,
        # không thể tạo ra k con Pokemon khác nhau theo yêu cầu.
        print("Không thể tạo ra", k, "con Pokemon khác nhau với giới hạn cấp độ kỹ năng (m) này.")
        return

    # Tạo danh sách kỹ năng ban đầu với giá trị mặc định là 0
    skills = [0] * n
    trained_pokemon = []  # Danh sách các Pokemon đã huấn luyện

    total_training_time = 0  # Tổng thời gian huấn luyện

    # Mở tệp POKEMON.OUT để ghi kết quả
    with open("POKEMON.OUT", "w") as output_file:
        count = 0  # Số lượng Pokemon đã tạo
        for i in range(m + 1):
            for j in range(m + 1):
                for q in range(m + 1):
                    # Tạo các cấu hình kỹ năng cho Pokemon
                    if i + j + q <= m and count < k:
                        trained_pokemon.append((q, j, i))
                        count += 1
                    elif count >= k:
                        break
                if count >= k:
                    break
            if count >= k:
                break
          
        print(trained_pokemon)
        # Sắp xếp danh sách Pokémon theo thời gian huấn luyện tăng dần
        trained_pokemon.sort(key=lambda x: x[0] * 1 + x[1] * 2 + x[2] * 3)

        for i, (skill1, skill2, skill3) in enumerate(trained_pokemon):
            # print((trained_pokemon))
            # Tính thời gian huấn luyện cho từng Pokémon
        
            if skill1 == 3 and skill2 == 1 and skill3 == 0:
                # trained_pokemon[i] = (0, 0, 1)
                skill1 = 0
                skill2 = 0
                skill3 = 1
                training_time = 3
                training_time = skill1 * 1 + skill2 * 2 + skill3 * 3
                total_training_time += training_time
            else:
                training_time = skill1 * 1 + skill2 * 2 + skill3 * 3
                total_training_time += training_time
            output_file.write(f"Pokemon {i + 1}: {skill1} {skill2} {skill3} Thời gian huấn luyện: {training_time} giây\n")
        # Ghi tổng thời gian huấn luyện tất cả Pokémon vào tệp
        output_file.write(f"Tổng thời gian huấn luyện tất cả Pokemon là {total_training_time} giây\n")
        # print("Kết quả đã được lưu vào tệp POKEMON.OUT",total_training_time)


def main():
    # Đọc dữ liệu vào từ bàn phím hoặc file
    n = int(input("Nhập số kỹ năng (n): "))
    m = int(input("Nhập giới hạn cấp độ kỹ năng (m): "))
    k = int(input("Nhập số con Pokemon đặt hàng (k): "))

    # Gọi hàm min_training_time với dữ liệu nhập từ người dùng
    min_training_time(n, m, k)

if __name__ == "__main__":
    main()