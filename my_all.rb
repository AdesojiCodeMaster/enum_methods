require_relative 'my_each.rb'
module Enumerable
  # give out true when all elements obey the conditions
  def my_all?(*input)
    output = true
    if !input[0].nil?
      my_each { |n| output = false unless input[0] === n } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |n| output = false unless n }
    else
      my_each { |n| output = false unless yield(n) }
    end
    output
  end
end

puts 'my_all? method using Ruby doc test examples'
p %w[ant bear cat].my_all?(nil) { |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_all?(nil) { |word| word.length >= 4 } #=> false
p %w[ant bear cat].my_all?(/t/) #=> false
p [1, 2i, 3.14].my_all?(Numeric) #=> true
p [nil, true, 99].my_all? #=> false
p [].my_all? #=> true
