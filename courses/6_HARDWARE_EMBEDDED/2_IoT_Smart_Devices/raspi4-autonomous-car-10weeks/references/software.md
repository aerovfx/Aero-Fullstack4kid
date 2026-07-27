# Hướng Dẫn Cài Đặt Phần Mềm Xe Tự Hành Raspberry Pi 4 / Software Setup Guide

---

## 🛠️ Danh Sách Phần Mềm & Thư Viện Lập Trình Xe Tự Hành

1. **Raspberry Pi OS 64-bit (Debian Bookworm)**:
   - Tải phần mềm **Raspberry Pi Imager** từ https://www.raspberrypi.com/software/
   - Chọn OS: `Raspberry Pi OS (64-bit)`. Cấu hình sẵn Username, Password, Wi-Fi SSID và Bật dịch vụ `SSH`.

2. **Cài Đặt Thư Viện Python 3 & OpenCV**:
   - Mở Terminal trên Raspberry Pi 4 chạy các lệnh cài đặt:
     ```bash
     sudo apt update && sudo apt upgrade -y
     sudo apt install -y python3-pip python3-opencv libopencv-dev
     pip3 install numpy matplotlib scipy pigpio adafruit-circuitpython-pca9685
     ```

3. **Cài Đặt Thư Viện TFLite Runtime (Edge AI)**:
   - Cài đặt môi trường suy luận TensorFlow Lite siêu nhẹ cho Pi 4:
     ```bash
     pip3 install tflite-runtime
     ```

4. **Cài Đặt Hệ Điều Hành Robot ROS 2 Humble (Ubuntu 22.04 LTS hoặc Docker)**:
   - Cài đặt ROS 2 Humble Hawksbill để quản lý các node điều khiển robot:
     ```bash
     sudo apt install ros-humble-desktop ros-humble-teleop-twist-keyboard
     source /opt/ros/humble/setup.bash
     ```

5. **Kết Nối Điều Khiển Từ Xa SSH & VNC Viewer**:
   - Tải phần mềm **RealVNC Viewer** trên máy tính/điện thoại để truy cập giao diện đồ họa Desktop của Raspberry Pi 4 không dây.
