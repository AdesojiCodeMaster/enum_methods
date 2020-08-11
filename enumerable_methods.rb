module Enumerable
  
    # print out individual element
  def my_each
      return self.dup unless block_given? #to prevent block from throwing errors
      i = 0
      while i <= self.length - 1 #while loop
        yield(self[i])
        i += 1
      end
  end

  # print out individual element with corresponding index
  def  my_each_with_index
    return self.dup unless block_given? #to prevent block from throwing errors
    i = 0
    while i <= self.length - 1 #while loop
      yield(self[i], i)
      i += 1
    end
  end

  def my_select # print out a new array according to the select condition
    return self.dup unless block_given? #to prevent block from throwing errors
    new_array = []
    self.my_each {|num| new_array << num if yield(num)} # iteration
    new_array
  end
  def my_all?(*input) # give out true all elements met the conditions
    result = true # to standadise
    if input[0] != nil
      self.my_each {|n| result = false unless input[0] == n}
     elsif !block_given?
      self.my_each {|n| result = false unless n}
     elsif
      self.my_each {|n| result = false unless yield(n)}
      else
      self.my_each{|k, v| result = false unless yield(k,v)}
    end
    result
  end

  def my_any?(*input) # my_any? looks like opposite of my_all? return true if any of the elements obeys
    result = false
    if input[0] != nil
      self.my_each {|n| result = true if input[0] == n}
     elsif !block_given?
      self.my_each {|n| result = true if n}
     elsif
      self.my_each {|n| result = true if yield(n)}
      else
        self.my_each {|k,v| result = true if yield(k,v)}
    end
    result
  end
  
  def my_none?(input = nil)
    return true if count.zero? || (self[0].nil? && !include?(true))
    return false unless block_given? || !input.nil?
    output = true
    if self.class == Array
      self.my_each do |n|
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
        self.my_each do |k, v|
          output = false if yield(k, v)
          break unless output
        end
    end
    output
  end
  
  def my_count(ele = nil)
    counter = 0 
    if block_given?
      self.my_each {|n| counter += 1 if yield(n)}
      elsif ele
      self.my_each {|n| counter += 1 if n == ele}
      else
      counter = self.length
    end
    counter
  end
end

[1, 2, 3].my_each { |num| puts num }
[1, 2, 3].my_each_with_index { |num, idx| puts "num is #{num} at index #{idx}" }
p [1, 2, 3].my_select { |num| num.even?}
p [1, 2, 3].my_all? { |num| num.even? }
p [1, 2, 3].my_all? {}
p [1, 2, 3].my_any? { |num| num.even? }
p [2, 4, 6].my_any? { |num| num%3==0 }
p [1, 2, 3].my_any? {}
p [false, false, nil].my_any? {}
p [1, 14, 42].my_none?(Float)
p [].my_none?
p [nil].my_none?
p [nil, false].my_none?
p [nil, false, true].my_none?
ary = [1, 2, 4, 2]
p ary.count
p ary.count(2)
p ary.count{ |x| x%2==0 }
p (1..4).map { |i| i*i }
p (1..4).collect { "cat" }


