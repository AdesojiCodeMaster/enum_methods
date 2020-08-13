module Enumerable
  # give true or false in respect to the supplied condition
  def my_none?(input = nil)
    result = true # to standardise
    my_each{
      result = false if block_given? && yield(n)
    }
    result
  end
end