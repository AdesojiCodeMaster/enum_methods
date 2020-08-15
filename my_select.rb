require_relative 'my_each.rb'
module Enumerable
  # print out a new array according to the select condition
  def my_select
    return enum_for unless block_given? # to prevent block from throwing errors

    new_array = []
    my_each { |num| new_array << num if yield(num) } # iteration
    new_array
  end
end
puts 'my_select method using Ruby doc test example'
p [1, 2, 3, 4, 5].select(&:even?) #=> [2, 4]
