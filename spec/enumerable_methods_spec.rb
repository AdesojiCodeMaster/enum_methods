require_relative '../enumerable_methods'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5] }
  let(:arr) { [1, 1] }
  let(:arr2) { [1, 2] }
  let(:text_array) { %w[ant bear cat] }
  let(:nil_array) { [false, nil] }
  # test for my_each
  context '#my_each' do
    it 'returns enumerator if block not given' do
      expect(array.my_each).to be_an(Enumerable)
    end
    it 'returns elements in the array if block given' do
      expect(array.my_each { |n| puts n }).to eq(array.each { |n| puts n })
    end
  end
  # test for my_each_with_index
  context '#my_each_with_index' do
    it 'returns enumerator if block not given' do
      expect(array.my_each_with_index).to be_an(Enumerable)
    end
    it "returns elements and corresponding index in the array if block given" do
      expect(array.my_each_with_index { |n, i| puts "#{n} => #{i}" }).to eq(array.each_with_index { |n, i| "#{n}, #{i}" })
    end
  end
  # test for my_select
  context '#my_select' do
    it 'returns enumerator if block not given' do
      expect(array.my_each_with_index).to be_an(Enumerable)
    end
    it 'returns elements that match with a condition' do
      expect(array.my_select { |n| n > 2 }).to eq(array.select { |n| n > 2 })
    end
  end
  # test for my_all?
  context '#my_all?' do
    it 'returns false if block not given and argument it is diferent of all items on the array' do
      expect(arr2.my_all?(1)).to eq(false)
    end
    it 'returns true if block not given and argument it is equal to all items on the array' do
      expect(arr.my_all?(1)).to eq(true)
    end
    it 'returns false if block is given and condition is not met by all elemnts' do
      expect(text_array.my_all? { |word| word.length >= 4 }).to eq(false)
    end
    it 'returns true if block is given and condition is met by all elemnts' do
      expect(text_array.my_all? { |word| word.length <= 4 }).to eq(true)
    end
    it 'returns false if block is not given and no parameter and the items from the array are all false or nil' do
      expect(nil_array.my_all?).to eq(false)
    end
  end
  # test for my_any?
  context '#my_any?' do
    it 'returns false if no block or parameter is given' do
      expect(text_array.my_any?).to eq(true)
    end
    it 'returns true if a parameter is given and at least one of the elements meets the condition' do
      expect(arr2.my_any?(1)).to eq(true)
    end
    it 'returns false when a block is given and none of the elements meets the condition' do
      expect(arr2.my_any? { |n| n > 5 }).to eq(false)
    end
    it 'returns false when no block is given and all the elements are false or nil' do
      expect(nil_array.my_any?).to eq(false)
    end
  end
  # test for my_none?
  context '#my_none?' do
    it 'returns false if no block or parameter is given and there are elements in the object' do
      expect(text_array.my_none?).to eq(false)
    end
    it 'returns true if a parameter is given and at none of the elements meets the condition' do
      expect(arr2.my_none?(3)).to eq(true)
    end
    it 'returns true when a block is given and none of the elements meets the condition' do
      expect(arr2.my_none? { |n| n > 5 }).to eq(true)
    end
    it 'returns true when no block is given and all the elements are false or nil' do
      expect(nil_array.my_none?).to eq(true)
    end
  end
  # test for my_count
  context '#my_count' do
    it 'returns the number of elements of the object if no block or parameter is given' do
      expect(text_array.my_count).to eq(3)
    end
    it 'returns the number of elements of the argument passed' do
      expect(text_array.my_count('ant')).to eq(1)
    end
    it 'returns the number of elements that match the condition in the block' do
      expect(text_array.my_count { |i| i.is_a? String }).to eq(3)
    end
  end
  # test for my_map
  context '#my_map' do
    it 'returns enumerable if block or argument is not given' do
      expect(array.my_map).to be_an(Enumerable)
    end
    it 'returns the result of the block given' do
      expect(array.my_map { |i| i * 2 }).to eq([2, 4, 6, 8, 10])
    end
  end
  # test for my_inject
  context '#my_inject' do
    it 'returns sum if block is given' do
      expect(array.my_inject { |sum, n| sum + n }).to eq(15)
    end
    it 'returns result if argument it is a symbol' do
      expect(array.my_inject(:+)).to eq(15)
    end
    it 'returns result if there are two arguments and one is a symbol' do
      expect(array.my_inject(2, :*)).to eq(240)
    end
    it 'returns product if block and argument is given' do
      expect(array.my_inject(2) { |product, n| product * n }).to eq(240)
    end
  end
  # test for mulptiply_els
  context '#multiply_els' do
    it 'multiply the array given' do
      expect(multiply_els(array)).to eq(120)
    end
  end
end
