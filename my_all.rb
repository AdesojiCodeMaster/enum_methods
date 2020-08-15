require_relative 'my_each.rb'
module Enumerable
  # return true when all elements meet the conditions
  def my_all?(input = nil)
    result = true # to standardise
    if input.is_a?(Regexp)
      my_each { |n| return false unless n[input] == 1 }
    elsif !block_given?
      my_each { |n| result = false unless n }
    else
      my_each { |n| result = false unless yield(n) }
    end
    result
  end
end

puts 'my_all? method using Ruby doc test examples'
p %w[ant bear cat].my_all?(nil) { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_all?(nil) { |word| word.length >= 4 } #=> false
p %w[ant bear cat].my_all?(/t/)                        #=> false
p [1, 2i, 3.14].my_all?(Numeric)                       #=> true
p [nil, true, 99].my_all?                              #=> false
p [].my_all?                                           #=> true
