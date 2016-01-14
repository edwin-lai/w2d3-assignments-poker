require 'rspec'
require 'card.rb'

describe Card do
  subject(:card) { Card.new("7", "♣")}

  describe '#value' do
    it "returns the value" do
      expect(card.value).to eq("7")
    end
  end

  describe '#suit' do
    it "returns the suit" do
      expect(card.suit).to eq("♣")
    end
  end

  describe '#inspect' do
    it "returns the card's suit and value" do
      expect(card.inspect).to eq("7♣")
    end
  end
end
