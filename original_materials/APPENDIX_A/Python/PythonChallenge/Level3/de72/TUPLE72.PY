def sort_tuple(t):
    sorted_tuple = tuple(sorted(t))
    return sorted_tuple

# Test the function
book_tuple = ("Python Crash Course", "Clean Code", "The Pragmatic Programmer", "Introduction to Algorithms")
sorted_books = sort_tuple(book_tuple)
print(f"The sorted tuple of books is: {sorted_books}")
