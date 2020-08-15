module Enumerable
  # print out individual element
  def my_each
    return enum_for unless block_given? # to prevent block from throwing errors

    i = 0
    while i <= to_a.length - 1 # while loop
      yield(to_a[i])
      i += 1
    end
  end
end

# puts 'my_each method using Ruby doc test examples';
# puts 'my_each method with array'
# ary = [1, 2, 4, 2]
# ary.my_each { |x| p x } #=> 1 2 4 2
# puts 'my_each method with range'
# ary = (1..5)
# ary.my_each { |x| p x } #=> 1 2 3 4 5
# puts 'my_each method with hash'
# ary = { full: 20, fill: 15 }
# ary.my_each { |x| p x } #=> [:full, 20] [:fill, 15]
