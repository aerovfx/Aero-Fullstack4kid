<<<<<<< HEAD
def find_next_string(S):
    # Tìm vị trí pos
    pos = -1
    for i in range(len(S)-2, -1, -1):
        if S[i] < S[i+1]:
            pos = i
            break
    
    if pos == -1:
        # Xâu S đã là số lớn nhất có thể có
        return S
    
    # Tìm vị trí next_pos
    next_pos = pos + 1
    for i in range(pos + 1, len(S)):
        if S[i] > S[pos] and S[i] < S[next_pos]:
            next_pos = i
    
    # Hoán đổi kí tự tại vị trí pos và next_pos
    S = list(S)
    S[pos], S[next_pos] = S[next_pos], S[pos]
    
    # Sắp xếp các kí tự từ pos+1 đến cuối xâu S
    S[pos+1:] = sorted(S[pos+1:])
    
    return ''.join(S)


# Đọc xâu S từ tệp tin XAU42.INP
with open('XAU42.INP', 'r') as f:
    S = f.read().strip()

# Tìm xâu S1 bằng cách hoán vị các kí tự số trong xâu S
S1 = find_next_string(S)

# Ghi kết quả vào tệp tin XAU42.OUT
with open('XAU42.OUT', 'w') as f:
    f.write(S1)
=======
# Đọc xâu S từ tệp tin XAU42.INP
with open('XAU42.INP', 'r') as file_in:
    S = file_in.readline().strip()

# Tìm vị trí pos
pos = -1
for i in range(len(S) - 1):
    if S[i] < S[i+1]:
        pos = i

if pos == -1:
    # Ghi "IMPOSSIBLE" vào tệp tin XAU42.OUT
    with open('XAU42.OUT', 'w') as file_out:
        file_out.write("IMPOSSIBLE")
else:
    # Tìm vị trí max_pos
    max_pos = -1
    for j in range(pos+1, len(S)):
        if S[j] > S[pos]:
            max_pos = j

    # Hoán vị S[pos] và S[max_pos]
    S = list(S)
    S[pos], S[max_pos] = S[max_pos], S[pos]

    # Đảo ngược các phần tử từ pos+1 đến cuối của xâu S
    S = S[:pos+1] + S[pos+1:][::-1]

    # Ghi xâu S vào tệp tin XAU42.OUT
    with open('XAU42.OUT', 'w') as file_out:
        file_out.write("".join(S))
>>>>>>> 52f0aee02b18761e019da96d0ddf5998068ec9b0
