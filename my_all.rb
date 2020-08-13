module Enumerable
  # return true when all elements meet the conditions
  def my_all?(input = nil)
    result = true # to standardise
    if !input.nil? && !input.is_a?(Class)
      if input.is_a?(Regexp)
        my_each { |n| return false unless !n[input].nil? || n[input] == 1 }
      else
        my_each { |n| return false unless n == input }
      end
    elsif input.is_a?(Class)
      my_each { |n| return false unless n.is_a?(input) }
    elsif input.nil? && block_given?
      my_each { |n| return false unless yield n }
    else
      my_each { |n| return false if n.nil? || n == false }
    end
    result
  end
end
