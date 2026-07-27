#Viết một chương trình chấp nhận đầu vào là một câu, đếm chữ hoa, chữ thường.
s = input("Nhập câu của bạn: ")
d={"UPPER CASE":0, "LOWER CASE":0}

for c in s:
    if c.isupper():
        d["UPPER CASE"]+=1
    elif c.islower():
        d["LOWER CASE"]+=1
    else:
        pass
print ("Chữ hoa:", d["UPPER CASE"])
print ("Chữ thường:", d["LOWER CASE"])