def encode_tuple(tuple_data):
    string = ', '.join(map(str, tuple_data))
    return string

# Test the function
personnel_tuple = ('John', 'Jane', 'David', 'Emily')
encoded_string = encode_tuple(personnel_tuple)
print(f"The encoded string is: {encoded_string}")
