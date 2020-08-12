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
  # print out individual element with corresponding index
  def my_each_with_index 
    return enum_for unless block_given? # to prevent block from throwing errors
    
    i = 0
    while i <= length - 1 # while loop
      yield(self[i], i)
      i += 1
    end
  end
  # print out a new array according to the select condition
  def my_select
    return enum_for unless block_given? # to prevent block from throwing errors
    
    new_array = []
    my_each { |num| new_array << num if yield(num) } # iteration
    new_array
  end
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
      my_each { |k, v| result = false unless yield(k, v) }
    end
    result
  end
  # my_any? looks like opposite of my_all? return true if any of the elements obeys
  def my_any?(*input)
    result = false
    if !input[0].nil?
      my_each { |n| result = true if input[0] == n }
    elsif !block_given?
      my_each { |n| result = true if n }
    elsif
    my_each { |n| result = true if yield(n) }
    else
      my_each { |k, v| result = true if yield(k, v) }
    end
    result
  end
  # give true or false in respect to the supplied condition
  def my_none?(input = nil)
    return true if count.zero? || (self[0].nil? && !include?(true))
    return false unless block_given? || !input.nil?
    
    output = true
    if self.class == Array
      my_each do |n|
        if block_given?
          output = false if yield(n)
        elsif input.class == Regexp
          output = false if n.matche(input)
        elsif input.class <= Numeric
          output = false if n == input
        elsif n.class <= input
          output = false
        end
        break unless output
      end
    else
      my_each do |k, v|
        output = false if yield(k, v)
        break unless output
      end
    end
    output
  end
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
  # print new array according to the condition
  def my_map  
    return enum_for unless block_given? # to prevent block from throwing errors
    
    map_arr = []
    if self == Array
        my_each { |n| map_arr << yield(n) }
    else
        my_each { |k, v| map_arr << yield(k, v) }
    end
  end
  # to sum-up
  def my_inject(*input)
    return enum_for unless block_given? # to prevent block from throwing errors
    
    argument = input + self
    return nil if argument.length.zero?
    return argument[0] if argument.length == 1

    output = argument[0]
    argument[1..argument.length - 1].my_each { |num| output = yield(output, num) }
    output
  end
end
# for multiplication
def multiply_els(input)
  input.my_inject { |k, n| k * n }
end
# Modify our #my_map
def my_map(proc = nil) 
  return enum_for unless block_given? # to prevent block from throwing errors

  new_array = []
  if proc
    my_each { |n| new_array << pro.call(n) }
  else
    self.each { |n| new_array << yield(n) }
  end
  new_array
end
