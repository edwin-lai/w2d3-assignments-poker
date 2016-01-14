require 'rspec'
require 'array.rb'


describe Array do
  describe "#my_uniq" do
    let(:array) { [1,2,3,3,3,4,5,6,6,6] }

    it "removes duplicates from array" do
      expect(array.my_uniq).to eq([1,2,3,4,5,6])
    end

    it "returns identical array if no duplicates" do
      expect([1,3,4,5].my_uniq).to eq([1,3,4,5])
    end
  end

  describe '#two_sum' do
    let(:array) { [-1, 0, 2, -2, 1] }

    it "returns indices of pairs that sum to zero" do
      expect(array.two_sum).to eq([[0, 4], [2, 3]])
    end
  end

  describe '#my_transpose' do
    let(:array) {
      [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
      ]
    }

    it "transposes a square matrix" do
      expect(array.my_transpose).to eq([
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8]
        ])
    end
  end

  describe '#stock_picker' do
    let(:array) { [3,6,4,7,5,9,8,3] }

    it "picks most profitable days" do
      expect(array.stock_picker).to eq([0,5])
    end

    it "returns empty if no positive profit" do
      expect([5,4,3,2,1].stock_picker).to eq([])
    end
  end


end
