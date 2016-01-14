require 'set'
require_relative 'deck'
class Hand
  attr_accessor :cards

  def initialize
    @cards = Set.new
  end

  def add_card_to_hand(*card)
    cards += card
  end

  def remove_cards(*card)
    cards -= card
  end

  RANK_HASH = {
    "2" => 2,
    "3" => 3,
    "4" => 4,
    "5" => 5,
    "6" => 6,
    "7" => 7,
    "8" => 8,
    "9" => 9,
    "10" => 10,
    "J" => 11,
    "Q" => 12,
    "K" => 13,
    "A" => 14,
  }

  HAND_RANK = {
    straight_flush: 8,
    four_of_a_kind: 7,
    full_house: 6,
    flush: 5,
    straight: 4,
    three_of_a_kind: 3,
    two_pair: 2,
    one_pair: 1,
    crappy_hand: 0
  }

  def self.winner(first, second)
    first_rank = HAND_RANK[first.classify]
    second_rank = HAND_RANK[second.classify]
    if first_rank > second_rank
      return first
    elsif first_rank < second_rank
      return second
    else
      if first.high_card > second.high_card
        return first
      elsif second.high_card > first.high_card
        return second
      else
        :draw
      end
    end
  end

  def high_card
    highest = 0
    @cards.each do |card|
      highest = RANK_HASH[card.value] if RANK_HASH[card.value] > highest
    end
    RANK_HASH.key(highest)
  end

  def classify
    if straight_flush?
      :straight_flush
    elsif four_of_a_kind?
      :four_of_a_kind
    elsif full_house?
      :full_house
    elsif flush?
      :flush
    elsif straight?
      :straight
    elsif three_of_a_kind?
      :three_of_a_kind
    elsif two_pair?
      :two_pair
    elsif one_pair?
      :one_pair
    else
      :crappy_hand
    end
  end

  def value_frequency
    result = Hash.new(0)
    @cards.each do |card|
      result[card.value] += 1
    end
    result
  end

  def suit_frequency
    result = Hash.new(0)
    @cards.each do |card|
      result[card.suit] += 1
    end
    result
  end

  private

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    value_frequency.values.include?(4)
  end

  def full_house?
    value_frequency.values.include?(3) &&
      value_frequency.values.include?(2)
  end

  def flush?
    suit_frequency.keys.count == 1
  end

  def straight?
    this_hand = value_frequency.keys
    this_hand = this_hand.map {|key| RANK_HASH[key] }.sort
    return true if this_hand == [2, 3, 4, 5, 14]
    this_hand.last - this_hand.first < 5
  end


  def three_of_a_kind?
    value_frequency.values.include?(3)
  end

  def two_pair?
    value_frequency.keys.count == 3
  end

  def one_pair?
    value_frequency.keys.count == 4
  end
end
