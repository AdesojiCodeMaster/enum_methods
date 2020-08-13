module Enumerable
  # return true when all elements meet the conditions
  def my_all?
    return enum_for unless block_given? # to prevent block from throwing errors
    
    result = true # to standardise
    my_each { |n| result = false unless yield(n) }
    result
  end
end
