module Enumerables
  def my_inject( input = nil)
    # to sum-up
    return enum_for unless block_given? # to prevent block from throwing errors
    
    input = input.to_a  
    argument = input + self
    return nil if argument.length.zero?
    return argument[0] if argument.length == 1

    output = argument[0]
    argument[1..argument.length - 1].my_each { |num| output = yield(output, num) }
    output
  end
end
def multiply_els(input)
  # for multiplication
  input.my_inject { |k, n| k * n }
end
