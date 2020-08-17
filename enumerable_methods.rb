module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    size.times do |idx|
      yield(to_a[idx])
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each) unless block_given?

    size.times do |idx|
      yield(to_a[idx], idx)
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    new_array = []
    my_each { |num| new_array << num if yield(num) }
    new_array
  end

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

  def my_any?(*input)
    output = false # to standardise
    if !input[0].nil?
      my_each { |n| output = true if input[0] === n } # rubocop:disable Style/CaseEquality
    elsif !block_given?
      my_each { |n| output = true if n }
    else
      my_each { |n| output = true if yield(n) }
    end
    output
  end

  def my_none?(input = nil, &block)
    !my_any?(input, &block)
  end

  def my_count(input = nil)
    counter = 0
    my_each do |idx|
      if !block_given?
        counter += 1 if input.nil? || idx == input
      elsif yield idx
        counter += 1
      end
    end
    counter
  end

  def my_map(input = nil)
    return to_enum(:my_map) if input.nil? && !block_given?

    new_array = []
    if input.nil?
      my_each_with_index { |n, m| new_array[m] = yield(n) }
    else
      my_each_with_index { |n, m| new_array[m] = input.call(n) }
    end
    new_array
  end

  def my_inject(input1 = nil, input2 = nil) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength, Metrics/PerceivedComplexity
    raise TypeError, "#{input1} is not a symbol nor a string" if input1.is_a?(Integer) && input2.nil? && !block_given?

    raise LocalJumpError, 'No block Given or Empty Argument' if input1.nil? && input2.nil? && !block_given?

    base = nil
    symb = nil
    if !input1.nil? && !input2.nil?
      base = input1
      symb = input2
      my_each do |n|
        base = base.send(symb, n)
      end
    elsif input1.is_a? Symbol
      symb = input1
      my_each { |n| base = (base ? base.send(symb, n) : n) }
    else
      base = input1
      my_each { |n| base = (base ? yield(base, n) : n) }
    end
    base
  end
end

def multiply_els(input = nil)
  raise TypeError, 'No Array Given' if input.nil? || !input.is_a?(Array)

  input.my_inject(:*)
end
