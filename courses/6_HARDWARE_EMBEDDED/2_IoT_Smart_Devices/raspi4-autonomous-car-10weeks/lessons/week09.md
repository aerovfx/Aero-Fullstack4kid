# Tuần 9: Nhập Môn Hệ Điều Hành Robot ROS 2 Trực Tiếp Trên Raspberry Pi 4 (ROS 2 Humble & Nodes)

## Mục Tiêu / Objectives

### Tiếng Việt (Vietnamese)
- Nắm vững kiến trúc chuẩn công nghiệp **Hệ điều hành Robot (Robot Operating System - ROS 2 Humble Hawksbill)**.
- Hiểu các khái niệm cốt lõi trong ROS 2: **Nodes (Nút xử lý)**, **Topics (Chủ đề dữ liệu)**, **Publishers (Nút phát)**, **Subscribers (Nút thu)** và **Messages (`geometry_msgs/Twist`)**.
- Xây dựng hệ thống phân tán nhúng trên Raspberry Pi 4 chia tách các nhiệm vụ: Node Đọc Cảm Biến $\to$ Node Xử Lý Điều Hướng $\to$ Node Lái Động Cơ.
- Thực hành điều khiển xe tự hành bằng bàn phím từ xa qua gói tin ROS 2 **`teleop_twist_keyboard`**.

### English
- Master the industrial standard **Robot Operating System 2 (ROS 2 Humble Hawksbill)** architecture.
- Understand ROS 2 core concepts: **Nodes**, **Topics**, **Publishers**, **Subscribers**, and **Messages (`geometry_msgs/Twist`)**.
- Build modular embedded ROS 2 nodes on Raspberry Pi 4: Sensor Node $\to$ Navigation Node $\to$ Motor Driver Node.
- Practice remote vehicle teleoperation using ROS 2 **`teleop_twist_keyboard`**.

---

## Lý Thuyết / Theory

### 1. Kiến Trúc Mạng Truyền Thông ROS 2 Nodes & Topics

```text
 ┌─────────────────────────┐                            ┌─────────────────────────┐
 │ ROS 2 NODE:             │ ─── ( Topic: /cmd_vel ) ──►│ ROS 2 NODE:             │
 │ Teleop Keyboard / OpenCV│      geometry_msgs/Twist   │ Motor Controller Engine │
 └─────────────────────────┘                            └─────────────────────────┘
```

---

## Code Mẫu Thực Hành / Code Implementations

### Code 1: Python 3 - ROS 2 Motor Subscriber Node (`rclpy`)
```python
"""
Lesson 9: ROS 2 Motor Controller Subscriber Node (rclpy)
Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks
"""

import rclpy
from rclpy.node import Node
from geometry_msgs.msg import Twist

class ROS2MotorSubscriber(Node):
    def __init__(self):
        super().__init__('ros2_motor_subscriber')
        # Subscribe to '/cmd_vel' topic with message type Twist
        self.subscription = self.create_subscription(
            Twist,
            '/cmd_vel',
            self.cmd_vel_callback,
            10)
        self.get_logger().info('[+] ROS 2 Motor Controller Node Active!')

    def cmd_vel_callback(self, msg):
        linear_x = msg.linear.x   # Forward/Backward speed (m/s)
        angular_z = msg.angular.z # Turning speed (rad/s)

        self.get_logger().info(f"[ROS 2 CMD_VEL] Linear X: {linear_x:.2f} m/s | Angular Z: {angular_z:.2f} rad/s")

        # Map ROS 2 velocities to hardware motor PWM & Servo steering
        # Linear X > 0 -> Drive Forward
        # Angular Z > 0 -> Turn Left, Angular Z < 0 -> Turn Right

def main(args=None):
    rclpy.init(args=args)
    motor_node = ROS2MotorSubscriber()
    
    try:
        rclpy.spin(motor_node)
    except KeyboardInterrupt:
        pass
    finally:
        motor_node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()
```

---

## Bài Tập Thực Hành & Bài Về Nhà / Hands-on Exercises & Homework

---

### 🟢 Phần A: Bài Tập Cơ Bản (Basic Level)

#### Bài 9.1: Tạo ROS 2 Publisher Node Phát Dữ Liệu Siêu Âm
Viết script Python `ultrasonic_publisher.py` khởi tạo một ROS 2 Node phát dữ liệu khoảng cách siêu âm lên Topic `/sensor/distance` mỗi $100\,\text{ms}$.

#### Bài 9.2: Kiểm Tra Danh Sách ROS 2 Topics Bằng CLI
Sử dụng các câu lệnh ROS 2 CLI trên Terminal: `ros2 node list`, `ros2 topic list`, `ros2 topic echo /cmd_vel` để kiểm thử hệ thống.

---

### 🟡 Phần B: Bài Tập Nâng Cao (Advanced Level)

#### Bài 9.3: Node OpenCV Chuyển Đổi Hình Ảnh Thành ROS 2 Teleop Topic
Viết ROS 2 Node kết hợp OpenCV: Đọc camera, tính toán độ lệch làn đường và tự động phát tin nhắn `Twist` lên topic `/cmd_vel` để lái xe.

---

### 🔴 Phần C: Thực Hành Colab / Giả Lập ROS 2 (Hands-on Colab Lab)

#### Bài 9.4: Giả Lập Hệ Thống ROS 2 Node Trên Google Colab
Mở Google Colab, cài đặt `rclpy` và mô phỏng luồng gửi nhận gói tin `geometry_msgs/Twist` giữa 2 Node.

---

### 💡 Đáp Án Tham Khảo Cho Bài Lab Colab (Lab Reference Solution)

```python
# ROS 2 Concept Reference Solution on Colab
import rclpy
from geometry_msgs.msg import Twist

rclpy.init()
node = rclpy.create_node('colab_teleop_publisher')
pub = node.create_publisher(Twist, '/cmd_vel', 10)

msg = Twist()
msg.linear.x = 0.5  # Move Forward
msg.angular.z = 0.2 # Turn Slight Left

pub.publish(msg)
print(f"[ROS 2 SIMULATION] Published /cmd_vel: Linear X={msg.linear.x}, Angular Z={msg.angular.z}")
rclpy.shutdown()
```

---

## Đánh Giá / Assessment Rubric

| Tiêu Chí | Xuất Sắc (9-10) | Tốt (7-8) | Đạt (5-6) | Cần Cố Gắng (<5) |
| :--- | :--- | :--- | :--- | :--- |
| **Kiến Thức ROS 2 Framework** | Giải thích sâu sắc kiến trúc ROS 2 Humble, Nodes, Topics, Messages `geometry_msgs/Twist` và mô hình phân tán. | Hiểu cách tạo Node Publisher/Subscriber bằng Python `rclpy`. | Nắm được định nghĩa ROS 2 nhưng chưa chạy được Node. | Lỗi cài đặt ROS 2 environment. |
| **Hoàn Thành Bài Tập Code** | Hoàn thành xuất sắc cả 4 bài (Ultrasonic Publisher, ROS 2 CLI, OpenCV ROS 2 Node & Colab ROS 2 Lab). | Hoàn thành Bài 9.1 và Bài 9.2 đúng yêu cầu. | Code có lỗi mất kết nối Topic hoặc không nhận tin nhắn. | Không nộp mã nguồn thực thi. |

---

*(Bản quyền khóa học: Aero-Fullstack4kid - RasPi 4 Autonomous Vehicles 10 Weeks)*
## 20 code minh họa của tuần

- [Mở mục lục code tuần 09](../code/week09/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 09](../code/week09/README.md), học lần lượt từ `01_...` đến `20_...`.
