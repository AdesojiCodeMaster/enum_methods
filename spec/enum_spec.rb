require './enumerable_methods.rb'


array_1 = [1, 2, 3]
describe Enumerable do
  describe '#my_each' do
    it '[1, 2, 3].each_cons(3) { |a| a } should return [1, 2, 3]' do
      expect(array_1.my_each { |a| a }).to eql([1, 2, 3])
    end
  end

  describe '#my_each_with_index' do
    array_2 = ['cat', 'dog', 'wombat']
    array_2_expected = {"cat"=>0, "dog"=>1, "wombat"=>2}
    hash_new = Hash.new  
    puts "TESTING RUBY-DOCS #{array_2.each_with_index { |item, index| hash_new[item] = index }}"
    it '%w(cat dog wombat).my_each_with_index { |item, index| hash[item] = index } should return {"cat"=>0, "dog"=>1, "wombat"=>2}' do
      expect(array_2.each_with_index { |item, index| hash_new[item] = index }).to eql(array_2_expected)
    end
  end  
end