def input_sequence():
    while True:
        try:
            sequence = input("Nhập một xâu các số (chỉ gồm 0 và 1): ")
            sequence = [int(x) for x in sequence]
            if all(x == 0 or x == 1 for x in sequence):
                return sequence
            else:
                print("Bạn đã nhập sai, đề nghị nhập lại.")
        except ValueError:
            print("Bạn đã nhập sai, đề nghị nhập lại.")

def longest_consecutive_subsequence(sequence):
    max_length = 0
    current_length = 1

    for i in range(1, len(sequence)):
        if sequence[i] == sequence[i - 1]:
            current_length += 1
        else:
            max_length = max(max_length, current_length)
            current_length = 1

    return max(max_length, current_length)

def longest_consecutive_subsequence_degree_1(sequence):
    max_length = 0
    for i in range(len(sequence)):
        for j in range(i + 1, len(sequence)):
            if sequence[j] != sequence[i]:
                max_length = max(max_length, j - i)
                break

    return max_length

# Nhập dãy số từ bàn phím
sequence = input_sequence()

# Tính độ dài lớn nhất của một dãy con đúng
max_length_consecutive = longest_consecutive_subsequence(sequence)
print(f"Độ dài lớn nhất của một dãy con đúng là: {max_length_consecutive}")

# Tính độ dài lớn nhất của một dãy con đúng bậc 1
max_length_consecutive_degree_1 = longest_consecutive_subsequence_degree_1(sequence)
print(f"Độ dài lớn nhất của một dãy con đúng bậc 1 là: {max_length_consecutive_degree_1}")
