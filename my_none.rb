module Enumerable
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