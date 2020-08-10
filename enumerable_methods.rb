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
end
  
   [1,2,3].my_each {|num| puts num}

   [1,2,3].my_each_with_index {|num, idx| puts "num is #{num} at index #{idx}"}
   