def findLongestIncreasingSubsequence(string):
    n = len(string)  # Độ dài của xâu
    dp = [1] * n  # Mảng dp lưu độ dài của xâu con tăng dần tại mỗi vị trí, khởi tạo ban đầu đều là 1
    
    for i in range(1, n):  # Duyệt qua từng ký tự trong xâu, bắt đầu từ vị trí thứ 1
        for j in range(i):  # Duyệt qua tất cả các ký tự trước vị trí i
            if string[i] > string[j]:  # So sánh ký tự ở vị trí i với ký tự ở vị trí j
                dp[i] = max(dp[i], dp[j] + 1)  # Nếu ký tự ở vị trí i lớn hơn ký tự ở vị trí j, cập nhật độ dài xâu con tăng dần tại vị trí i
   
    result = ""  # Xâu con tăng dần dài nhất
    previous_length = 0  # Độ dài xâu con tăng dần tại vị trí trước đó
    for i in range(n):  # Duyệt qua từng ký tự trong xâu ban đầu
        if dp[i] > previous_length:  # Nếu độ dài xâu con tăng dần tại vị trí i lớn hơn độ dài tại vị trí trước đó
            result += string[i]  # Thêm ký tự vào xâu con tăng dần dài nhất
            previous_length = dp[i]  # Cập nhật độ dài tại vị trí trước đó thành độ dài tại vị trí i
            
    return result

# Ví dụ sử dụng
input_string = "abcdabcefghkga"
longest_subsequence = findLongestIncreasingSubsequence(input_string)
print("Xâu con tăng dần dài nhất trong xâu", input_string, "là:", longest_subsequence)

