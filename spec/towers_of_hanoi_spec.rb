require 'rspec'
require 'towers_of_hanoi'

describe TowersOfHanoi do
  subject(:tower) { TowersOfHanoi.new }

  describe '#render' do
    it "displays the initial state on a new game" do
      expect(tower.render).to eq([[8,7,6,5,4,3,2,1], [], []])
    end

    it "displays the new state after discs move" do
      tower.move(1,2)
      expect(tower.render).to eq([[8,7,6,5,4,3,2], [1], []])
    end
  end

  describe '#move' do
    it "moves top disc from one specified tower to another" do
      tower.move(1,2)
      expect(tower.left).to eq([8,7,6,5,4,3,2])
      expect(tower.middle).to eq([1])
      expect(tower.right).to eq([])
    end

    it "raises an error if a larger disc is moved on top of a smaller disc" do
      tower.move(1,2)
      expect { tower.move(1,2) }.to raise_error(ArgumentError)
    end

    it "raises an error if player tries to move from an empty tower" do
      expect { tower.move(3,2) }.to raise_error(ArgumentError)
    end
  end

  describe '#won?' do
    it 'returns true if game is won' do
      tower.left = []
      tower.right = []
      tower.middle = [8, 7, 6, 5, 4, 3, 2, 1]
      expect(tower.won?).to be(true)
    end

    it "returns false if the game is not won" do
      tower.left = [2,1]
      tower.right = []
      tower.middle = [8, 7, 6, 5, 4, 3]
      expect(tower.won?).to be(false)
    end
  end
end
