x = input('nhập vào xâu:')
def chuyendoixau(words):
    words = x.split()
    camel_case_words = [word.capitalize() for word in words]
    chuyendoi = ''.join(camel_case_words)
    return chuyendoi
    
print('xuất ra:',chuyendoixau(x))
