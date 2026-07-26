#Viết một chương trình (sử dụng các hàm) yêu cầu người dùng nhập một chuỗi dài gồm nhiều từ. In lại cho người dùng một chuỗi mới với thứ tự từ ngữ được đảo ngược lại với thứ tự ban đầu. Ví dụ, khi người dùng nhập chuỗi: Toi la Phuong thì in ra màn hình Phuong la Toi
sentense = input("Enter a sentence: ")
words = sentence.split()
words.reverse()
sentence = " ".join(words)
print(sentence)