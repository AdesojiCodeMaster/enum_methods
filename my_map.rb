require_relative 'my_each.rb'
module Enumerable
  def my_map
    # print new array according to the condition
    return enum_for unless block_given? # to prevent block from throwing errors

    map_arr = []
    if self == Array
      my_each { |n| map_arr << yield(n) }
    else
      my_each { |k, v| map_arr << yield(k, v) }
    end
    map_arr
  end
end
puts 'my_map method using Ruby doc test examples'
(1..4).my_map { |i| puts i * i } #=> [1, 4, 9, 16]
