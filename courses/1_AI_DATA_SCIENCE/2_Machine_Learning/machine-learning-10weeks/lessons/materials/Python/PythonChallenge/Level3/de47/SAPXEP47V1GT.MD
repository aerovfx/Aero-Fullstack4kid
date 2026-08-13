## Giải thuật

Định nghĩa hàm sum_of_digits(number): Hàm này nhận vào một số nguyên number và tính tổng các chữ số của số đó. Sử dụng vòng lặp while để lấy lần lượt từng chữ số cuối cùng của number và cộng vào biến sum_digits. Sau mỗi lần lặp, ta chia number cho 10 để lược bỏ chữ số cuối cùng đã lấy. Cuối cùng, hàm trả về tổng các chữ số tính được.<br/>
Nhập số nguyên N từ người dùng.<br/>
Nhập dãy số từ người dùng. Chuỗi nhập vào sẽ được split thành các phần tử trong danh sách numbers.<br/>
Chuyển các phần tử trong danh sách numbers từ chuỗi sang số nguyên bằng cách sử dụng comprehension.<br/>
Tìm số có tổng các chữ số lớn nhất trong dãy numbers. Sử dụng hàm max với đối số key=sum_of_digits để tìm số có tổng các chữ số lớn nhất.<br/>
In ra số có tổng các chữ số lớn nhất.<br/>
In ra dãy số đảo ngược bằng cách sử dụng comprehension. Trong comprehension, mỗi số trong numbers được chuyển thành một chuỗi rồi đảo ngược các ký tự trong chuỗi đó.<br/>