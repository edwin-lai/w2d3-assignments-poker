require 'rspec'
require 'player'

describe Player do
  describe '#hand' do
    let(:player) { Player.new }

    it "returns the player's hand" do
      expect(player.hand.class).to eq(Hand)

      context "returns non-empty hand after cards have been dealt" do
        card_set = Set.new [
          Card.new('A','♠'),
          Card.new('2','♣'),
          Card.new('3','♠'),
          Card.new('4','♦'),
          Card.new('5','♠')
        ]
        player.hand.add_card_to_hand(card_set)

        expect(player.hand).to be(card_set)
      end
    end
  end

  describe '#pot' do
    let(:player) { Player.new }

    it "is initialized to 100" do
      expect(player.pot).to be(100)
    end

    it "returns player's current pot amount" do
      player.pot = 50

      expect(player.pot).to be(50)
    end
  end

  describe '#discard' do
    let(:player) { Player.new }
    before(:each) do
      player.hand.cards = Set.new [
        Card.new('A','♠'),
        Card.new('2','♣'),
        Card.new('3','♠'),
        Card.new('4','♦'),
        Card.new('5','♠')
      ]
    end

    it "prompts the player for cards to discard" do
      expect(STDOUT).to receive(:puts)

      allow(STDIN).to receive(:gets) { "A♣" }
      expect(STDIN).to receive(:gets)
    end

    it "gets rid of unwanted cards" do
      allow(STDIN).to receive(:gets) { "A♣" }
      player.discard

      expect(player.hand.cards).to eq(
        Set.new [
          Card.new('2','♣'),
          Card.new('3','♠'),
          Card.new('4','♦'),
          Card.new('5','♠')
        ]
      )
    end

    it "returns the number of cards the player has discarded" do
      allow(STDIN).to receive(:gets) { "A♣" }
      expect(player.discard).to be(1)
    end
  end
end
