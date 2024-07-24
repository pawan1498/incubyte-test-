class StringCalculator
    def self.add(numbers)
      return 0 if numbers.empty?

      if numbers.start_with?("//")
        delimiter = numbers[2]
        numbers = numbers[4..]
      else
        delimiter = /,|\n/
      end
  
      number_array = numbers.split(delimiter).map(&:to_i)
      negative_numbers = number_array.select { |num| num < 0 }
  
      unless negative_numbers.empty?
        raise "negative numbers not allowed: #{negative_numbers.join(', ')}"
      end
  
      number_array.sum
    end
  end
  



# Problem statement 
#   Create a simple String calculator with a method signature like this:

# int add(string numbers)
# Input: a string of comma-separated numbers
# Output: an integer, sum of the numbers
# Examples:

# Input: “”, Output: 0
# Input: “1”, Output: 1
# Input: “1,5”, Output: 6
# Allow the add method to handle any amount of numbers.

# Allow the add method to handle new lines between numbers (instead of commas). ("1\n2,3" should return 6)

# Support different delimiters:

# To change the delimiter, the beginning of the string will contain a separate line that looks like this: "//[delimiter]\n[numbers…]". For example, "//;\n1;2" where the delimiter is ";" should return 3.
# Calling add with a negative number will throw an exception: "negative numbers not allowed <negative_number>".

# If there are multiple negative numbers, show all of them in the exception message, separated by commas.


# TEST CASES 
# 1. ("1\n2,3")
# 2. ("//;\n1;2")

# p StringCalculator.add("1\n2,3")