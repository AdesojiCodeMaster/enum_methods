module Enumerable
  # my_any? looks like opposite of my_all? return true if any of the elements obeys
<<<<<<< HEAD
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
=======
  def my_any?(*input)
    result = false
    if !input[0].nil?
      my_each { |n| result = true if input[0] = n }
    elsif !block_given?
      my_each { |n| result = true if n }
    else
      my_each { |n| result = true if yield(n) }
>>>>>>> 625c05904a43e79ed92b5a7db92e021be83f221b
    end
    result
  end
end
