module Enumerable
  # give true or false in respect to the supplied condition
  def my_none?(input = nil, &block)
    !my_any?(input, &block)
  end
end
