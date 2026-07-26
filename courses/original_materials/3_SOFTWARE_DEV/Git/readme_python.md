Chú ý:
1. Để chạy được chương trình python thì cần thiết lập môi trường ảo cho nó. Lệnh cài đặt là python venv:
python venv topic_python/myvirtualenv/baobaoapp_env

2. Sử dụng lệnh pip để cài các module cần thiết:
pip install django 

3. Cách làm việc nhóm.
-Sử dụng github để tạo không gian làm dự án chung.
Bước 1: Clone repositories có địa chỉ:
https://github.com/aerovfx/Fullstack4kid.git
sử dụng: CMD, Visual Code, sublimetext, gitbash
Cú pháp: git clone [địa chỉ]

-Tạo một nhánh con (Branch Tên của mình) sau khi được quản lí add vào nhóm biên tập.
cú pháp: Git branch [tên nhánh đặt theo tên mình]
-Soạn thảo code, kiểm thử code

-Chuyển file vừa soạn vào trạng thái chuẩn bị đẩy lên Git
Cú pháp:
git add . [. post lên tất cả ]
git add [tên file: chỉ post file mình cần]

git commit -m 'Soạn ghi chú sự thay đổi của code vào đây'

git push origin main [dành cho quản lí]
git push origin branch [tên nhánh con vừa tạo khi nãy]
Ví dụ: git push origin baobao_tkinter 

-Kiểm tra trạng thái, kiểm tra sau và trước khi post.
git status




