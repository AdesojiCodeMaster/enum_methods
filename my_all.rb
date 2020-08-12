module Enumerable
  # return true when all elements meet the conditions
  def my_all?(*input)
    result = true # to standardise
    if !input[0].nil?
      my_each { |n| result = false unless input[0] == n }
    elsif !block_given?
      my_each { |n| result = false unless n }
    elsif
      my_each { |n| result = false unless yield(n) }
    else
      my_each { |k, v| result = false unless yield(k, v) }
    end
    result
  end
end
p (%w[ant bear cat].all? { |word| word.length >= 3 })
p (%w[ant bear cat].all? { |word| word.length >= 4 })
p %w[ant bear cat].all?(/t/)
p [1, 2i, 3.14].all?(Numeric)
p [nil, true, 99].all?
p [].all?
