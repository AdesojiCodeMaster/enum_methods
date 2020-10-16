require './enumerable_methods.rb'
array = [1, 2, 3]
puts array.my_each
describe Enumerable do
  describe '#my_each' do
    it 'array.each_cons(3) { |a| a } should return [1, 2, 3]' do
      expect(array.my_each { |a| a }).to eql([1, 2, 3])
    end
  end
end