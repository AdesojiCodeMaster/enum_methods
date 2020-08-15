require_relative 'my_inject.rb'
# Please comment out the test examples in my_inject.rb before running this file to prevent interference
def multiply_els(input)
  p input.my_inject(1) { |sum, n| sum * n }
end
puts 'multiply_els method using Ruby doc test examples'
multiply_els([2, 4, 5]) #=> 40
