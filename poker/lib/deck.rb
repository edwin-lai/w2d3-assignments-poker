require_relative 'card'
class Deck

  attr_reader :cards

  def initialize
    @cards = []
    %w(♠ ♥ ♦ ♣).each do |suit|
      %w(A 2 3 4 5 6 7 8 9 10 J Q K).each do |value|
        @cards << Card.new(value, suit)
      end
    end
    @cards.shuffle!
  end





  def draw
    raise StandardError.new if @cards.empty?
    @cards.pop
  end





  def cards_remaining
    @cards.count
  end

end
