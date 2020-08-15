require_relative 'my_each.rb'
module Enumerable
  # my_any? looks like opposite of my_all? return true if any of the elements obeys
  def my_any?(input = nil)
    result = false # to standardise
    if input.is_a?(Regexp)
      my_each { |n| return true if n[input] == 1 }
    elsif !block_given?
      my_each { |n| result = true if n }
    else
      my_each { |n| result = true if yield(n) }
    end
    result
  end
end

puts 'my_any? method using Ruby doc test examples'
p %w[ant bear cat].my_any?(nil) { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_any?(nil) { |word| word.length >= 4 } #=> true
p %w[ant bear cat].my_any?(/d/) #=> false
p [nil, true, 99].my_any?(Integer) #=> true
p [nil, true, 99].my_any? #=> true
p [].my_any? #=> false
