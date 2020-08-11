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
  def my_select
    return self.dup unless block_given?
    new_array=[]
    i = 0
    self.my_each { 
      new_array << self[i] if yield(self[i]) 
      i += 1
    }
    return new_array
  end
  def my_all
    result = true
    i = 0
    self.my_each{
      if (block_given? && !yield(self[i]))
        result = false
      elsif !self[i]
        result = false
      end
      i += 1
    }
    return result
  end
end
  
   [1, 2, 3].my_each { |num| puts num }

   [1, 2, 3].my_each_with_index { |num, idx| puts "num is #{num} at index #{idx}" }

   [1, 2, 3].my_select { |num| num.is_even? }

   [1, 2, 3].my_all { |num| num.is_even? }

   [1, 2, 3].my_all {}
