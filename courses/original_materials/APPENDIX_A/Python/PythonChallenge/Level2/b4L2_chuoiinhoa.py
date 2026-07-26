#Viết một chương trình chấp nhận chuỗi là các dòng được nhập vào, chuyển các dòng này thành chữ in hoa và in ra màn hình. Giả sử đầu vào là:
#Hello world
#Practice makes perfect

#Thì đầu ra sẽ là:

#HELLO WORLD
#PRACTICE MAKES PERFECT
lines = []
while True:
    s = input("Nhập chuỗi (nhập trống để kết thúc): ")
    if not s:
        break
    lines.append(s.upper())

for sentence in lines:
    print(sentence)
