module Enumerables
  def my_inject( input = nil)
    # to sum-up
    return enum_for unless block_given? # to prevent block from throwing errors
    
    input = input.to_a
    argument = input + self
    return nil if argument.length.zero?
    return argument[0] if argument.length == 1

    if base
      array.my_each { |n| output = output ? output.send(base, n) : n }
    else
      array.my_each { |n| output = output ? yield(output, n) : n }
    end
    output
  end
end
def multiply_els(input)
  # for multiplication
  input.my_inject { |k, n| k * n }
end
