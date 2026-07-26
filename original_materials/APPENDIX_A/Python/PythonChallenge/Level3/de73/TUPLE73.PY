def count_element(tuple_data, element):
    count = tuple_data.count(element)
    return count

# Test the function
vegetable_tuple = ("Carrot", "Tomato", "Broccoli", "Carrot", "Cabbage", "Carrot")
element = "Carrot"
count = count_element(vegetable_tuple, element)
print(f"The element '{element}' appears {count} times in the tuple.")
