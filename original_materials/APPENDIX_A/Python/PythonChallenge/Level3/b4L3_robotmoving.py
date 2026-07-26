"""Bài 4:

Câu hỏi:

Một Robot di chuyển trong mặt phẳng bắt đầu từ điểm đầu tiên (0,0). Robot có thể di chuyển theo hướng UP, DOWN, LEFT và RIGHT với những bước nhất định. Dấu di chuyển của robot được đánh hiển thị như sau:

UP 5

DOWN 3

LEFT 3

RIGHT 3

Các con số sau phía sau hướng di chuyển chính là số bước đi. Hãy viết chương trình để tính toán khoảng cách từ vị trí hiện tại đến vị trí đầu tiên, sau khi robot đã di chuyển một quãng đường. Nếu khoảng cách là một số thập phân chỉ cần in só nguyên gần nhất.

Ví dụ: Nếu tuple sau đây là input của chương trình:

UP 5
DOWN 3
LEFT 3
RIGHT 2
thì đầu ra sẽ là 2.
Gợi ý:
Trong trường hợp dữ liệu đầu vào được nhập vào chương trình nó 
nên được giả định là dữ liệu được người dùng nhập vào từ giao diện điều khiển.

sử dụng công thức pythago để tính khoảng cách đường đi.
"""
import math
pos = [0,0] #Đầu tiên, chương trình khởi tạo một list pos để lưu trữ tọa độ hiện tại của Robot trong mặt phẳng. Ban đầu, vị trí hiện tại được đặt là (0,0).
while True: #Tiếp theo, chương trình sử dụng một vòng lặp while True để yêu cầu người dùng nhập các hướng di chuyển và số bước tương ứng.
    s = input()
    if not s:
        break
    movement = s.split(" ")
    direction = movement[0]
    steps = int(movement[1])
    if direction=="UP":
        pos[0]+=steps
    elif direction=="DOWN":
        pos[0]-=steps
    elif direction=="LEFT":
        pos[1]-=steps
    elif direction=="RIGHT":
        pos[1]+=steps
    else:
        pass

print (int(round(math.sqrt(pos[1]**2+pos[0]**2))))