module Enumerable
  # my_any? looks like opposite of my_all? return true if any of the elements obeys
  def my_any?(input = nil)
    result = false # to standardise
    if input.is_a?(Regexp)
      my_each { |n| return true if n[input] == 1 }
    elsif !block_given?
      my_each { |n| result = true if n }
    else
      my_each { |n| result = true if yield(n) }
    end
    result
  end
end
