module Enumerable
  # my_any? looks like opposite of my_all? return true if any of the elements obeys
  def my_any?(input = nil)
    result = false # to standardise
    if length == 1
      return false if self[0].nil? || self[0] == empty? || self[0] == false
    elsif input.is_a?(Regexp)
      my_each { |n| return true if !n[input].nil? || n[input] == 1 }
    elsif input.nil? && !block_given?
      my_each { |n| return true if !n.nil? && n != false }
    elsif !input.is_a?(Class) && !block_given?
      my_each { |n| return true if n == input }
    elsif input.is_a?(Class)
      my_each { |n| return true if n.is_a?(input) }
    elsif block_given?
      my_each { |n| return true if yield n }
    end
    result
  end
end
