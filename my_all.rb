module Enumerable
  # return true when all elements meet the conditions
  def my_all?(input = nil)
    result = true # to standardise
    if input.is_a?(Regexp)
      my_each { |n| return false unless !n[input].nil? || n[input] == 1 }
    elsif !block_given?
      my_each { |n| result = false unless n }
    else
      my_each { |n| result = false unless yield(n) }
    end
    result
  end
end
