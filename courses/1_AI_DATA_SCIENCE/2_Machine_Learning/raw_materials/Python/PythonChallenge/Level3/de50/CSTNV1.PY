def find_nth_number(N):
    if N == 1:
        return 1
    
    prev_number = find_nth_number(N - 1)
    current_number = prev_number + N - 1
    return current_number

# Đọc dữ liệu từ tệp CSTN.INP
with open('CSTN.INP', 'r') as input_file:
    N = int(input_file.readline().strip())

# Tìm phần tử thứ N của dãy số
result = find_nth_number(N)

# Ghi kết quả vào tệp CSTN.OUT
with open('CSTN.OUT', 'w') as output_file:
    output_file.write(str(result))
"""
Giải thuật: Đệ quy

Hàm find_nth_number(N) nhận đầu vào là một số nguyên N và trả về giá trị của phần tử thứ N trong dãy số.
Nếu N bằng 1 (base case), hàm trả về giá trị 1.
Nếu N không bằng 1, hàm sẽ gọi đệ quy chính nó với đầu vào là (N - 1) để tính giá trị của phần tử thứ (N - 1) trong dãy.
Sau đó, giá trị của phần tử thứ N được tính bằng cách cộng giá trị phần tử thứ (N - 1) với (N - 1).
Cuối cùng, hàm trả về giá trị của phần tử thứ N.
Mã tiếp theo mở tệp CSTN.INP để đọc giá trị N, sau đó gọi hàm find_nth_number(N) để tính kết quả.
Kết quả được ghi vào tệp CSTN.OUT.
"""