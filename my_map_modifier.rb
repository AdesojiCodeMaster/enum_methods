require_relative 'my_each.rb'
module Enumerable
  def my_map(proc = nil)
    # Modify our #my_map
    return enum_for unless block_given? # to prevent block from throwing errors

    new_array = []
    if proc
      my_each { |n| new_array << pro.call(n) }
    else
      each { |n| new_array << yield(n) }
    end
    new_array
  end
end

puts 'my_map method using Ruby doc test examples'
(1..4).my_map(nil) { |i| puts i * i } #=> [1, 4, 9, 16]
