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
    result
  end
end

