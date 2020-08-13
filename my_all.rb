module Enumerable
  # return true when all elements meet the conditions
  def my_all?(input = nil)
    result = true # to standardise
<<<<<<< HEAD
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
=======
    if !input[0].nil?
      my_each { |n| result = false unless input[0] == n }
    elsif !block_given?
      my_each { |n| result = false unless n }
    elsif my_each { |n| result = false unless yield(n) }
    else
      my_each { |k, v| result = false unless yield(k, v) }
>>>>>>> 625c05904a43e79ed92b5a7db92e021be83f221b
    end
    result
  end
end
