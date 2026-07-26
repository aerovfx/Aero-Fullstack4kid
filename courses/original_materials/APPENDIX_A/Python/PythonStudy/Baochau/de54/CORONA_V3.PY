with open('CORONA.INP', 'r') as file:
    s = file.read()
     
def tim_cum_corona(s, target_word):
    char_counts = {char: s.count(char) for char in target_word}
    min_value = min(char_counts.values())
    
    # Tính toán kết quả dựa trên ký tự "O" nếu có
    if "O" in target_word:
        result = min(min_value, char_counts["O"] // 2)
    else:
        result = min_value
    
    return result

    
target_word = "MI"
a = tim_cum_corona(s, target_word)

with open('CORONA.OUT', 'w') as file:  
    file.write(str(a))