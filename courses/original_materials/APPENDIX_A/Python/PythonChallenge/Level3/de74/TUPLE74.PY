def compress_tuple(tuple_data):
    unique_tuple = tuple(set(tuple_data))
    return unique_tuple

# Test the function
coordinate_tuple = ((1, 2), (3, 4), (1, 2), (5, 6), (3, 4))
compressed_tuple = compress_tuple(coordinate_tuple)
print(f"The compressed tuple is: {compressed_tuple}")
