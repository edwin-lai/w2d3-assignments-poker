require 'rspec'
require 'deck.rb'

describe Deck do
  subject(:deck) { Deck.new }

  describe '#cards_remaining' do
    it 'initializes with 52 cards remaining' do
      expect(deck.cards_remaining).to be(52)
    end

    it 'reports how many cards remain in the deck' do
      deck.draw
      expect(deck.cards_remaining).to be(51)
    end

    it 'returns empty for an empty deck' do
      52.times { deck.draw }
      expect(deck.cards_remaining).to be(0)
    end
  end

  describe '#draw' do
    it 'deals a card' do
      expect(deck.draw.class).to eq(Card)
    end

    it 'raises an error if the deck is empty' do
      52.times { deck.draw }
      expect { deck.draw }.to raise_error(StandardError)
    end
  end
end
