# frozen_string_literal: true

module Enumerable
  # print out individual element with corresponding index
  def my_each_with_index
    return enum_for unless block_given? # to prevent block from throwing errors

    i = 0
    while i <= length - 1 # while loop
      yield(self[i], i)
      i += 1
    end
  end
end
