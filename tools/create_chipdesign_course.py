import os

BASE_DIR_CHIP = "/Users/dangvietchung/Aero-Fullstack4kid/courses/6_HARDWARE_EMBEDDED/1_Chip_Design/chip-design-10weeks"

lessons_chip = [
    ("Nhập môn Kỹ thuật Máy tính & Kiến trúc Von Neumann", "Sự tiến hoá của máy tính từ bóng bán dẫn (Transistors) đến vi mạch (IC). Tìm hiểu nguyên lý hoạt động của kiến trúc Von Neumann và bộ nhớ."),
    ("Mạch Logic Kỹ thuật số (Digital Logic)", "Làm quen với các cổng logic cơ bản: AND, OR, NOT, NAND, XOR. Xây dựng sơ đồ mạch điện bằng các phần mềm mô phỏng (Logisim)."),
    ("Đại số Boole & Tối ưu hoá mạch điện", "Ứng dụng Đại số Boole và bản đồ Karnaugh để rút gọn mạch logic, giúp thiết kế chip nhỏ gọn và tiết kiệm năng lượng hơn."),
    ("Mạch tổ hợp (Combinational Logic) & ALU", "Thiết kế bộ cộng (Adders), bộ giải mã (Decoders). Xây dựng Khối tính toán số học và logic (ALU) - trái tim của mọi CPU."),
    ("Mạch tuần tự (Sequential Logic) & Flip-Flops", "Khái niệm xung nhịp đồng hồ (Clock). Lưu trữ dữ liệu 1 bit bằng D Flip-Flop, SR Latch. Thiết kế thanh ghi (Registers) và bộ đếm (Counters)."),
    ("Kiến trúc Tập lệnh (Instruction Set Architecture - ISA)", "Tìm hiểu ngôn ngữ máy và Assembly. Khác biệt giữa RISC (như ARM dùng trong điện thoại di động) và CISC (như x86 dùng trong PC)."),
    ("Lập trình mô tả phần cứng (Verilog/VHDL) Cơ bản", "Chuyển đổi từ sơ đồ mạch đồ họa sang mã code. Viết mã Verilog đầu tiên để mô tả hoạt động của một cổng logic."),
    ("Thiết kế Bộ vi xử lý đơn giản (Simple CPU)", "Tích hợp ALU, Thanh ghi, và Bộ điều khiển (Control Unit) để tạo thành một bộ vi xử lý đơn giản có khả năng thực thi các lệnh Assembly cơ bản."),
    ("FPGA & Ứng dụng Thiết kế phần cứng thực tế", "Giới thiệu về FPGA (Field Programmable Gate Array). Biên dịch mã Verilog và nạp vào board FPGA để chạy thử mạch điện vật lý."),
    ("Đồ án cuối khoá: Xây dựng CPU 8-bit trên FPGA", "Áp dụng kiến thức toàn khoá để tự thiết kế một CPU 8-bit hoàn chỉnh, viết mã Assembly để CPU chạy một chương trình tính toán hiển thị lên đèn LED.")
]

def create_directory(path):
    os.makedirs(path, exist_ok=True)

def write_file(path, content):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

def generate_course(base_dir, title, desc, lessons, project_title, project_desc):
    print(f"Creating course at {base_dir}")
    create_directory(base_dir)
    create_directory(os.path.join(base_dir, "lessons"))
    create_directory(os.path.join(base_dir, "projects"))

    index_content = f"""# {title}

{desc}

## Cấu trúc thư mục
- \`schedule.md\`: Lộ trình chi tiết 10 tuần.
- \`lessons/\`: Lý thuyết mạch điện kỹ thuật số và thực hành Logisim/Verilog.
- \`projects/\`: Đồ án thiết kế vi xử lý.
"""
    write_file(os.path.join(base_dir, "INDEX.md"), index_content)

    schedule_content = f"# Lộ trình {title} (10 Tuần)\n\n"
    for i, (l_title, l_desc) in enumerate(lessons):
        schedule_content += f"## Tuần {i+1}: {l_title}\n- {l_desc}\n- [Chi tiết bài học](lessons/week{i+1:02d}.md)\n\n"
    write_file(os.path.join(base_dir, "schedule.md"), schedule_content)

    for i, (l_title, l_desc) in enumerate(lessons):
        week_num = i + 1
        lesson_content = f"""# Tuần {week_num}: {l_title}

## 1. Mục tiêu bài học
- {l_desc}

## 2. Công cụ Mô phỏng (Logisim / Vivado)
- Hướng dẫn kéo thả cổng logic trên Logisim hoặc viết mã HDL.

## 3. Lý thuyết Thiết kế
- Phân tích luồng tín hiệu (Data Path) và thời gian trễ (Propagation Delay).

## 4. Bài tập (Challenge)
- Giải một bài toán logic kỹ thuật số từ yêu cầu thực tế (ví dụ: Mạch điều khiển đèn giao thông).
"""
        write_file(os.path.join(base_dir, "lessons", f"week{week_num:02d}.md"), lesson_content)

    project_content = f"""# Đồ Án Cuối Khoá: {project_title}

## Mô Tả Yêu Cầu
{project_desc}
"""
    write_file(os.path.join(base_dir, "projects", "final_project.md"), project_content)

def main():
    generate_course(
        BASE_DIR_CHIP, 
        "Thiết kế Vi mạch Kỹ thuật số & CPU (Chip Design)", 
        "Học cách máy tính thực sự hoạt động ở mức độ vật lý. Đi từ những cổng logic đơn giản bằng bóng bán dẫn cho đến việc sử dụng ngôn ngữ mô tả phần cứng (Verilog) để tự chế tạo một bộ vi xử lý.",
        lessons_chip,
        "Chế tạo Bộ Vi xử lý 8-bit đa dụng",
        "Học viên sẽ thiết kế Data Path và Control Unit của một CPU 8-bit trên phần mềm Logisim (hoặc viết mã Verilog nạp lên board FPGA). CPU phải có khả năng đọc lệnh từ bộ nhớ (ROM), tính toán trên ALU và lưu kết quả vào RAM/Thanh ghi."
    )
    print("Successfully generated Chip Design course.")

if __name__ == "__main__":
    main()
