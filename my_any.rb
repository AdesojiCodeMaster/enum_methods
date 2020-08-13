module Enumerable
  # my_any? looks like opposite of my_all? return true if any of the elements obeys
  def my_any?(*input)
    result = false # to standardise
    my_each{
      result = true if block_given? || yield(n)
    }
    result
  end
end
