module Enumerable
  # give out true all elements met the conditions
  def my_all?(*input) 
    result = true # to standadise
    if !input[0].nil?
      my_each { |n| result = false unless input[0] == n }
    elsif !block_given?
      my_each { |n| result = false unless n }
    elsif
      my_each { |n| result = false unless yield(n) }
    else
      my_each{ |k, v| result = false unless yield(k, v) }
    end
    result
  end
end