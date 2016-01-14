require 'rspec'
require 'hand.rb'

describe Hand do
  # let(:hand) { Hand.new(Card.new("10","♥")) }

  describe '#classify' do
    it 'recognizes straight flushes' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('K','♠'),
      Card.new('Q','♠'),
      Card.new('J','♠'),
      Card.new('10','♠')
      )
      expect(hand.classify).to eq(:straight_flush)
    end

    it 'recognizes four of a kind' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('A','♣'),
      Card.new('A','♠'),
      Card.new('A','♦'),
      Card.new('10','♠')
      )
      expect(hand.classify).to eq(:four_of_a_kind)
    end

    it 'recognizes full house' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('A','♣'),
      Card.new('A','♠'),
      Card.new('10','♦'),
      Card.new('10','♠')
      )
      expect(hand.classify).to eq(:full_house)
    end

    it 'recognizes flush' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('K','♠'),
      Card.new('3','♠'),
      Card.new('J','♠'),
      Card.new('10','♠')
      )
      expect(hand.classify).to eq(:flush)
    end

    it 'recognizes straight' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('2','♣'),
      Card.new('3','♠'),
      Card.new('4','♦'),
      Card.new('5','♠')
      )
      expect(hand.classify).to eq(:straight)
    end

    it 'recognizes three of a kind' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('A','♣'),
      Card.new('A','♠'),
      Card.new('5','♦'),
      Card.new('10','♠')
      )
      expect(hand.classify).to eq(:three_of_a_kind)
    end

    it 'recognizes two pair' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('A','♣'),
      Card.new('8','♠'),
      Card.new('10','♦'),
      Card.new('10','♠')
      )
      expect(hand.classify).to eq(:two_pair)
    end

    it 'recognizes one pair' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('A','♣'),
      Card.new('3','♠'),
      Card.new('2','♦'),
      Card.new('10','♠')
      )
      expect(hand.classify).to eq(:one_pair)
    end

    it 'recognizes crappy hands' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('3','♣'),
      Card.new('7','♠'),
      Card.new('8','♦'),
      Card.new('5','♠')
      )
      expect(hand.classify).to eq(:crappy_hand)
    end
  end

  describe '#high_card' do
    it 'finds the highest ranking card in the hand' do
      hand = Hand.new
      hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('3','♣'),
      Card.new('7','♠'),
      Card.new('8','♦'),
      Card.new('5','♠')
      )
      expect(hand.high_card).to eq("A")
    end
  end

  describe '::winner' do
    it "returns the winning hand among hands" do
      bad_hand = Hand.new
      bad_hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('3','♣'),
      Card.new('7','♠'),
      Card.new('8','♦'),
      Card.new('5','♠')
      )
      good_hand = Hand.new
      good_hand.add_card_to_hand(
      Card.new('A','♠'),
      Card.new('A','♣'),
      Card.new('3','♠'),
      Card.new('2','♦'),
      Card.new('10','♠')
      )
      expect(Hand.winner(bad_hand, good_hand)).to be(good_hand)
      expect(Hand.winner(good_hand, bad_hand)).to be(good_hand)
      expect(Hand.winner(good_hand, good_hand)).to be(:draw)
    end
  end
end
