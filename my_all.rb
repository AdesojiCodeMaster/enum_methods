module Enumerable
  # return true when all elements meet the conditions
  def my_all?
    result = true # to standardise
    my_each { |n| result = false unless yield(n) }
    result
  end
end
