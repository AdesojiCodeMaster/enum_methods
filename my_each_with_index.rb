module Enumerable
  # print out individual element with corresponding index
  def my_each_with_index
    return enum_for unless block_given? # to prevent block from throwing errors

    i = 0
    while i <= to_a.length - 1 # while loop
      yield(to_a[i], i)
      i += 1
    end
  end
end

# test examples;
puts 'my_each_with_index method with array'
ary = [1, 2, 4, 2]
ary.my_each_with_index { |x, y| p "#{x} => #{y}" } #=> 1 => 0  2 => 1 4 => 2 2 => 3
puts 'my_each_with_index method with range'
ary = (1..5)
ary.my_each_with_index { |x, y| p "#{x} => #{y}" } #=> 1 => 0 2 => 1 3 => 2 4 => 3 5 => 4
puts 'my_each_with_index method with hash'
ary = { full: 20, fill: 15 }
ary.my_each_with_index { |x, y| p "#{x} => #{y}" } #=> [:full, 20] => 0 [:fill, 15] => 1
