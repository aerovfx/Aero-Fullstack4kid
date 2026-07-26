# Ví dụ 1
# Sử dụng danh sách 2 chiều để lưu trữ điểm của các sinh viên trong một lớp học. Mỗi hàng trong danh sách 2 chiều có thể đại diện cho một sinh viên và mỗi cột có thể đại diện cho một môn học. Chúng ta có thể tính tổng điểm, điểm trung bình, và thực hiện các phân tích khác với dữ liệu này.
# Khởi tạo danh sách điểm của sinh viên
# Khởi tạo danh sách điểm của sinh viên
scores = [
    [8, 7, 9, 6],    # Điểm của sinh viên 1 cho các môn học
    [6, 5, 8, 7],    # Điểm của sinh viên 2 cho các môn học
    [9, 8, 7, 6]     # Điểm của sinh viên 3 cho các môn học
]

# Tính tổng điểm của từng sinh viên
total_scores = []  # Danh sách để lưu trữ tổng điểm của từng sinh viên

# Duyệt qua từng sinh viên trong danh sách điểm
for student_scores in scores:
    total_score = sum(student_scores)  # Tính tổng điểm của sinh viên bằng cách sử dụng hàm sum()
    total_scores.append(total_score)   # Thêm tổng điểm vào danh sách total_scores

# Tính điểm trung bình của từng sinh viên
average_scores = []  # Danh sách để lưu trữ điểm trung bình của từng sinh viên

# Duyệt qua từng sinh viên trong danh sách điểm
for student_scores in scores:
    average_score = sum(student_scores) / len(student_scores)  # Tính điểm trung bình bằng cách chia tổng điểm cho số môn học
    average_scores.append(average_score)  # Thêm điểm trung bình vào danh sách average_scores

# In ra tổng điểm và điểm trung bình của từng sinh viên
for i in range(len(scores)):
    print(f"Sinh viên {i+1}: Tổng điểm = {total_scores[i]}, Điểm trung bình = {average_scores[i]}")
