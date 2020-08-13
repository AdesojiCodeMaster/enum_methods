module Enumerable
  # my_any? looks like opposite of my_all? return true if any of the elements obeys
  def my_any?
    result = false
    my_each { |n| result = true if yield(n) }
    result
  end
end
