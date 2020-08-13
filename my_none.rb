module Enumerable
  # give true or false in respect to the supplied condition
  def my_none?(input = nil)
    !my_any?(input)
  end
