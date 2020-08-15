require_relative 'my_each.rb'
module Enumerable
  # print out the number of elements
  def my_count(ele = nil)
    counter = 0
    if block_given? # to prevent block from throwing errors
      my_each { |n| counter += 1 if yield(n) }
    elsif ele
      my_each { |n| counter += 1 if n == ele }
    else
      counter = length
    end
    counter
  end
end

puts 'my_count method using Ruby doc test examples'
ary = [1, 2, 4, 2]
p ary.my_count #=> 4
p ary.my_count(2) #=> 2
p ary.my_count(&:even?) #=> 3
