module Enumerable
  # return true when all elements meet the conditions
  def my_all?(*input)
    result = true # to standardise
    my_each{
      result = false unless block_given? && yield(n)
    }
    result
  end
end