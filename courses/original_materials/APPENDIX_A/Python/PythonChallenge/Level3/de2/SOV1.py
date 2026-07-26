def find_geometric_sequences(a, q):
    sequences = []
    n = len(a)
    for i in range(n):
        for j in range(i + 1, n + 1):
            subsequence = a[i:j]
            is_geometric = True
            for k in range(len(subsequence) - 1):
                if subsequence[k + 1] != subsequence[k] * q:
                    is_geometric = False
                    break
            if is_geometric:
                sequences.append(subsequence)
    return sequences

a = [1, 2, 8, 4, 2]
q = 2

sequences = find_geometric_sequences(a, q)

for sequence in sequences:
    print(sequence)
