module Enumerable
  # my_any? looks like opposite of my_all? return true if any of the elements obeys
  def my_any?(*input)
    result = false
    if !input[0].nil?
      my_each { |n| result = true if input[0] = n }
    elsif !block_given?
      my_each { |n| result = true if n }
    else
      my_each { |n| result = true if yield(n) }
    end
    result
  end
end
