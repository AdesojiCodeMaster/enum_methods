module Enumerable
  # print out a new array according to the select condition
  def my_select
    return enum_for unless block_given? # to prevent block from throwing errors

    new_array = []
    my_each { |num| new_array << num if yield(num) } # iteration
    new_array
  end
end
