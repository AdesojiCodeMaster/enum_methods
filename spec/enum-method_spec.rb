require_relative '../enumerable_methods'

describe  Enumerable do
    let(:array){[1, 2, 3, 4, 5]}
    let(:arr){[1,1]}
    let(:arr2){[1,2]}
    let(:text_array){%w[ant bear cat]}
    let(:nil_array){[false, nil]}
    # test for my_each
    context "#my_each" do
        it "returns enumerator if block not given" do
        expect(array.my_each).to be_an(Enumerable)
        end
        it "returns elements in the array if block given" do
        expect(array.my_each{|n| puts n}).to eq(array.each{|n| n})
        end
    end
    # test for my_each_with_index
    context "#my_each_with_index" do
        it "returns enumerator if block not given" do
            expect(array.my_each_with_index).to be_an(Enumerable)
        end
        it "returns elements and corresponding index in the array if block given" do
            expect(array.my_each_with_index{|n, i| puts "#{n} => #{i}" }).to eq(array.each_with_index{|n, i| "#{n}, #{i}"})
        end
    end
    # test for my_select
    context '#my_select' do
        it "returns enumerator if block not given" do
            expect(array.my_each_with_index).to be_an(Enumerable)
        end
        it 'returns elements that match with a condition' do
            expect(array.my_select{|n| n>2}).to eq(array.select{|n| n>2})
        end
    end
    # test for my_all?
    context '#my_all?' do
        it "returns false if block not given and argument it's diferent of all items on the array" do
            expect(arr2.my_all?(1)).to eq(false)
        end
        it "returns true if block not given and argument it's equal to all items on the array" do
            expect(arr.my_all?(1)).to eq(true)
        end
        it 'returns false if block is given and condition is not met by all elemnts' do
            expect(text_array.my_all?{|word| word.length >= 4 }).to eq(false)
        end
        it 'returns true if block is given and condition is met by all elemnts' do
            expect(text_array.my_all?{|word| word.length <= 4 }).to eq(true)
        end
        it "returns false if block is not given and no parameter and the items from the array are all false or nil" do
            expect(nil_array.my_all?).to eq(false)
        end
    end
end
