module Enumerable
  # print out individual element
  def my_each
    return enum_for unless block_given? # to prevent block from throwing errors

    i = 0
    while i <= length - 1 # while loop
      yield(self[i])
      i += 1
    end
  end
end