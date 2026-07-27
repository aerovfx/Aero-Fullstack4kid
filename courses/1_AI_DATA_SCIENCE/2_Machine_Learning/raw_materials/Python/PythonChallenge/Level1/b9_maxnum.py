#Bài 9. Viết một hàm nhận vào ba số thực và trả về số lớn nhất trong ba số. 
#Lưu ý, không sử dụng hàm max() của Python.
# max of three numbers
def max_of_three(a, b, c):
    if a > b:
        if a > c:
            return a
        else:
            return c
    else:
        if b > c:
            return b
        else:
            return c
#Lưu ý, sử dụng hàm max() của Python.

def max2(a,b,c):
    max = max(a,b,c)
    return max
max = max (4,2,3)
print(max)