# frozen_string_literal: true

module Enumerable
  # print out the number of elements
  def my_count(ele = nil)
    counter = 0
    if block_given? # to prevent block from throwing errors
      my_each { |n| counter += 1 if yield(n) }
    elsif ele
      my_each { |n| counter += 1 if n == ele }
    else
      counter = length
    end
    counter
  end
end
