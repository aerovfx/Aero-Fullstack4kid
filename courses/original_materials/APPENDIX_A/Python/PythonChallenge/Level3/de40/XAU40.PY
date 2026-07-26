def generate_substrings(string):
    substrings = []
    n = len(string)

    for i in range(n):
        for j in range(i+1, n+1):
            substrings.append(string[i:j])

    return substrings

string = "abcdeefghi"
substrings = generate_substrings(string)

for substring in substrings:
    print(substring)
    