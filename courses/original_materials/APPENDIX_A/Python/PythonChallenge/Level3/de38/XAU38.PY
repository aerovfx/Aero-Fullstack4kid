# Hàm loại bỏ khoẳng trắng (spaces)
#C1: dùng hàm lambda:
remove_spaces = lambda s: ' '.join(s.split())

"""#Cách 2 dùng hàm thông thường
def remove_spaces(s):
    s =  ' '.join(s.split())
    return s
"""

# Yêu cầu nhập text

text = " Chào bạn.     Bạn khoẻ   không?"
result = remove_spaces(text)
print(result)  # Output: "Chào bạn. Bạn khoẻ không?"
