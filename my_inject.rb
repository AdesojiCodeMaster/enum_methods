require_relative 'my_each.rb'
module Enumerable
  # sum up
  def my_inject
    return enum_for unless block_given? # to prevent block from throwing errors

    argument = to_a
    output = argument[0]
    argument[1..argument.length - 1].my_each { |n| output = yield(output, n) }
    puts output
  end
end
(5..10).my_inject { |sum, n| sum + n } #=> 45
(5..10).my_inject { |product, n| product * n } #=> 151200
