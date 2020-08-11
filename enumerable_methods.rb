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
  def my_all
    result = false
    i = 0
    self.my_each{
      if (block_given? && yield(self[i]))
        result = true
      elsif self[i]
        result = true
      end
      i += 1
    }
    return result
  end
  def my_any
    result = false
    i = 0
    self.my_each{
      result = true if (block_given? && yield(self[i]))
      result = true if self[i]
      i += 1
    }
    return result
  end
  def my_none
    result = true
    i = 0
    self.my_each{
      result = false if (block_given? && yield(self[i]))
      result = false if self[i]
      i += 1
    }
    return result
  end
  def my_count
    result = 0
    i = 0
    self.my_each{
      result += 1 if (block_given? && yield(self[i])) || self[i]
      i += 1
    }
    return result
  end
end

[1, 2, 3].my_each { |num| puts num }
[1, 2, 3].my_each_with_index { |num, idx| puts "num is #{num} at index #{idx}" }
p [1, 2, 3].my_select { |num| num.even?}
[1, 2, 3].my_all { |num| num.even? }
[1, 2, 3].my_all {}
[1, 2, 3].my_any { |num| num.even? }
[2, 4, 6].my_any { |num| num%3==0 }
[1, 2, 3].my_any {}
[false, false, nil].my_any {}
[1, 3.14, 42].none?(Float)
[].none?
[nil].none?
[nil, false].none?
[nil, false, true].none?
p ary = [1, 2, 4, 2]
p ary.count
p ary.count(2)
p ary.count{ |x| x%2==0 }
p (1..4).map { |i| i*i }
p (1..4).collect { "cat" }