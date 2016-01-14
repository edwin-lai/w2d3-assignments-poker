class TowersOfHanoi
  attr_accessor :left, :middle, :right, :tower_hash

  def initialize
    @left = (1..8).to_a.reverse
    @middle = []
    @right = []
    @tower_hash = {
      1 => @left,
      2 => @middle,
      3 => @right
    }
  end

  def render
    [left, middle, right]
  end

  def move(start_pos, end_pos)
    raise ArgumentError.new "Start tower empty" if tower_hash[start_pos].empty?
    if tower_hash[end_pos].empty? || tower_hash[start_pos].last < tower_hash[end_pos].last
      tower_hash[end_pos] << tower_hash[start_pos].pop
      return self
    else
      raise ArgumentError.new "Start position larger than end position"
    end
  end

  def won?
    win_condition = (1..8).to_a.reverse
    @middle == win_condition || @right == win_condition
  end

  def play
    until won?
      p render
      puts "Move disc from which tower? (1/2/3)"
      start_pos = gets.chomp.to_i
      puts "Move disc to which tower? (1/2/3)"
      end_pos = gets.chomp.to_i
      move(start_pos, end_pos)
    end
    puts "You win!! :)"
  end
end

# class BadMoveError < StandardError
# end
