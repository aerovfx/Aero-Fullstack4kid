with open('VIRUS.INP','r') as file:
    s = file.readline()
# Block 1: Định nghĩa hàm xử lý dữ liệu
def tim_cum_tu(s, target_word):
    char_counts = {char: s.count(char) for char in target_word}
    min_count = min(char_counts.values())
    
    # Tính toán kết quả dựa trên ký tự "O" nếu có
    if "O" in target_word:
        kq = min(min_count, char_counts["O"] // 2)
    else:
        kq = min_count
    
    return kq
#Block 3:Goi ham tim_cum_tu:
target_word = "IN"
result = tim_cum_tu(s, target_word)
#Block 4:Ghi du lieu ra file:
with open('VIRUS.OUT','w') as file:  
    file.write(str(result) )