require_relative '../enumerable_methods'

describe  Enumerable do
    let(:array){[1, 2, 3, 4, 5]}
 
    # test for my_each
    context "#my_each" do
    it "returns original if block not given" do
     expect(array.my_each).to be_an(Enumerable)
    end
    it "returns elements in the array if block given" do
    expect(array.my_each{|n| puts n}).to eq(array.each{|n| n})
    end

    context "#my_each_with_index" do
    it "returns original if block not given" do
        expect(array.my_each_with_index).to be_an(Enumerable)
    end
    it "returns elements and corresponding index in the array if block given" do
        expect(array.my_each_with_index{|n, i| puts "#{n} => #{i}" }).to eq(array.each_with_index{|n, i| "#{n}, #{i}"})
    end

end


end











end