# CASUAL PSEUDO

# Given an array of integers
# Iterate through the collection one by one
# => Add the first integer to a new array
# => Skip the second integer
# => Repeat this process
# => Return new array

# FORMAL PSEUDO

# START

# SET array = nil
# METHOD that accepts new_array
# => If integer index is 0 (first) add to new_array
# => If integer index is odd, skip it
# => If integer index is even, add to new_array
# PRINT new_array
# END

# RUBY SYNTAX

def skip(array)
  new_array = []
  (0...array.length).step(2) { |i| new_array << array[i] }
  new_array
end

p skip([1, 2, 3, 5, 8, 13, 21, 34, 55, 89])
