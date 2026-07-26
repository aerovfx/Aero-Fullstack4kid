from itertools import combinations #Dòng này import hàm combinations từ module itertools. Hàm này sẽ được sử dụng để tạo ra tất cả các tổ hợp có thể từ danh sách các số.

<<<<<<< HEAD
def count_combinations(n, k, numbers): # Định nghĩa hàm count_combinations nhận đầu vào là n, k và numbers. Hàm này sẽ tính toán tất cả các tổ hợp có thể và trả về kết quả dưới dạng tập hợp (set) các tổ hợp.
    combinations = set()
=======
def count_combinations(n, k, numbers):
    combinations = set()  # Tạo một tập hợp rỗng để lưu trữ các tổ hợp
>>>>>>> 52f0aee02b18761e019da96d0ddf5998068ec9b0

    def find_combinations(target, current_combination, visited): #Định nghĩa hàm đệ quy find_combinations nhận các tham số target, current_combination và visited. Hàm này tìm các tổ hợp có tổng độ khó là target và có đúng k phần tử. Trong trường hợp tổ hợp hợp lệ, nó được thêm vào tập hợp combinations.
        if target == 0 and len(current_combination) == k:
            sorted_combination = tuple(sorted(current_combination))  # Sắp xếp tổ hợp để đảm bảo tính duy nhất
            combinations.add(sorted_combination)  # Thêm tổ hợp vào tập hợp
            return

        if target < 0 or len(current_combination) > k:
            return  # Không tìm thấy tổ hợp hợp lệ, thoát hàm

        for i in range(len(numbers)): # Vòng lặp for duyệt qua danh sách numbers để chọn các số chưa được thăm. Nếu số đó chưa được thăm, nó sẽ được thêm vào current_combination. Hàm find_combinations được gọi đệ quy với remaining (tổng còn lại sau khi chọn số), current_combination đã cập nhật và visited đã được đánh dấu. Sau khi quay lui, visited sẽ được đánh dấu lại là False để tiếp tục tìm kiếm các tổ hợp khác.
            if not visited[i]:
                visited[i] = True  # Đánh dấu số đã được chọn
                remaining = target - numbers[i]  # Tính tổng còn lại sau khi chọn số
                find_combinations(remaining, current_combination + [numbers[i]], visited)  # Gọi đệ quy với số tiếp theo
                visited[i] = False  # Bỏ đánh dấu số đã được chọn để thử các tổ hợp khác

<<<<<<< HEAD
    visited = [False] * len(numbers) # Mảng visited được khởi tạo với giá trị False cho mỗi số từ 1 đến n. Sau đó, hàm find_combinations được gọi để tìm các tổ hợp khác nhau.
    find_combinations(n, [], visited)

    return combinations # Kết quả là tập hợp (set) các tổ hợp combinations.

with open('DETHI.INP', 'r') as f: # Mở tệp "DETHI.INP" để đọc dữ liệu. n và k được đọc từ dòng đầu tiên của tệp. numbers được khởi tạo là danh sách các số từ 1 đến n.
    n, k = map(int, f.readline().split())
    numbers = list(range(1, n + 1))

dethi = count_combinations(n, k, numbers)
count = len(dethi) # Gọi hàm count_combinations để tính toán tất cả các tổ hợp có thể và lưu kết quả vào biến dethi. count lưu trữ số lượng tổ hợp trong dethi.
 
with open('DETHI.OUT', 'w') as f: # Mở tệp "DETHI.OUT" để ghi kết quả. Đầu tiên, số lượng tổ hợp (count) được ghi vào dòng đầu tiên của tệp. Sau đó, từng tổ hợp trong dethi được ghi vào các dòng tiếp theo, mỗi tổ hợp được viết dưới dạng các số cách nhau bởi dấu cách.
    f.write(str(count) + '\n')
=======
    visited = [False] * len(numbers)  # Tạo một mảng gồm các giá trị False để theo dõi các số đã được chọn
    find_combinations(n, [], visited)  # Gọi hàm đệ quy để tìm các tổ hợp

    return combinations  # Trả về tập hợp các tổ hợp

with open('DETHI.INP', 'r') as f:
    n, k = map(int, f.readline().split())  # Đọc dữ liệu từ tệp input
    numbers = list(range(1, n + 1))  # Tạo danh sách các số từ 1 đến n

dethi = count_combinations(n, k, numbers)  # Gọi hàm để tính toán các tổ hợp
count = len(dethi)  # Đếm số lượng tổ hợp

with open('DETHI.OUT', 'w') as f:
    f.write(str(count) + '\n')  # Ghi số lượng tổ hợp vào tệp output
>>>>>>> 52f0aee02b18761e019da96d0ddf5998068ec9b0
    for combination in dethi:
        f.write(' '.join(map(str, combination)) + '\n')  # Ghi từng tổ hợp vào tệp output
