module Enumerable
  def my_map  #print new array according to the condition
    return enum_for unless block_given? #to prevent block from throwing errors
    map_arr = []
    if self == Array
      self.my_each { |n| map_arr << yield(n)}
      else
      self.my_each {|k, v| map_arr << yield(k, v) }
    end
  end
end
def my_map(proc = nil) #Modify our #my_map
  return enum_for unless block_given? #to prevent block from throwing errors
  new_array []
  if proc
  self.my_each {|n| new_array << pro.call(n) }
  else
    self.each {|n| new_array << yield(n)}
  end
  new_array
end