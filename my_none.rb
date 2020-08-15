require_relative 'my_any.rb'
module Enumerable
  # give true or false in respect to the supplied condition
  def my_none?(input = nil, &block)
    !my_any?(input, &block)
  end
end
# please comment out test examples in my_any.rb before running my_none.rb to prevent interference!
puts 'my_none? method using Ruby doc test examples'
p %w{ant bear cat].my_none?(nil) { |word| word.length == 5 } #=> true
p %w[ant bear cat].my_none?(nil) { |word| word.length >= 4 } #=> false
p %w[ant bear cat].my_none?(/d/) #=> true
p [1, 3.14, 42].my_none?(Float) #=> false
p [].my_none? #=> true
p [nil].my_none? #=> true
p [nil, false].my_none? #=> true
p [nil, false, true].my_none? #=> false
