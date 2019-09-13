require "tdd"

RSpec.describe Array do
  describe "#my_uniq" do
    subject { [1,2,3,3,4,5,5] }

    it "Returns an array" do
      expect(subject.my_uniq).to be_an(Array)
    end

    it "Does not modify the original array" do
      expect(subject.my_uniq).to_not be(subject)
    end

    it "Includes only one of each element" do
      expect(subject.my_uniq).to eq(subject.uniq)
    end

    it "Does not call default #uniq" do
      expect(subject).to_not receive(:uniq)
      subject.my_uniq
    end
  end

  describe "#two_sum" do
    subject { [-1, 0, 2, -2, 1] }
    it "Returns a 2D array of indexes" do
      expect(subject.two_sum).to contain_exactly([2, 3], [0, 4])
    end

    it "Is in ascending order" do
      expect(subject.two_sum).to eq([[0,4], [2,3]])
    end
  end

  describe "#my_transpose" do
    subject { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
    it "Transposes an array from coluns to row and vice-versa" do
      expect(subject.my_transpose).to eq(subject.transpose)
    end
  end
end

RSpec.describe "#stock_picker" do

  it "Receives an array of prices as argument" do
    expect { stock_picker(["bananas"]) }.to_not raise_error
  end

  it "Returns nil if the market is going down" do
    expect(stock_picker([50,40,30,20,10])).to be_nil
  end

  it "Buys low and sells high" do
    expect(stock_picker([20,25])).to eq([0,1])
  end
end