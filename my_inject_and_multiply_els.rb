module Enumerables
  def my_inject(*input)
    # to sum-up
    array = is_a?(Array) ? self : to_a
    output = input[0] if input[0].is_a? Integer

    if input[0].is_a?(Symbol) || input[0].is_a?(String)
      base = arg[0]
    elsif input[0].is_a?(Integer)
      base = arg[1] if input[1].is_a?(Symbol) || input[1].is_a?(String)
    end

    if base
      array.my_each { |n| output = output ? output.send(base,n) : n }
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
