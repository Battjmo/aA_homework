class Board
  attr_accessor :cups, :stone, :current_player

  def initialize(name1, name2)
    @cups = Array.new(14) { Array.new }
    place_stones
    @name1 = name1
    @name2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    4.times do |i|
      self.cups[0..5].each { |cup| cup << :stone }
      self.cups[7..12].each { |cup| cup << :stone }
    end
  end

  class InvalidCupError < StandardError
    def message
      "Invalid starting cup"
    end
  end

  class StartingCupError < StandardError
    def message
      "Starting cup is empty"
    end
  end

  def valid_move?(start_pos)
    raise InvalidCupError unless start_pos.between?(0, 12)
    raise StartingCupError if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    current_cup = start_pos
    until stones.empty?
      current_cup += 1
      if current_cup > 13
        current_cup = 0
      end
      # if current_cup == 6 && current_player_name == @player1
      #   @cups[current_cup] << :stone
      #   stone_count -= 1
      # elsif current_cup == 13 && current_player_name == @player2
      #   @cups[current_cup] << :stone
      #   stone_count -= 1
      # else
      #   @cups[current_cup] << :stone
      #   stone_count -= 1
      if current_cup == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif current_cup == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[current_cup] << stones.pop
  end
    end
    render
    next_turn(current_cup)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    cup_count = self.cups[ending_cup_idx].count
    if (self.current_player == @player1 && ending_cup_idx == 6) || (self.current_player == @player2 && ending_cup_idx == 13)
      return :prompt
    elsif cup_count > 1
      return ending_cup_idx
    elsif cup_count == 1
      :switch
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups.take(6).all? { |cup| cup.empty? } ||
    cups[7..12].all? { |cup| cup.empty? }
  end

  def winner
    player1_score = @cups[6].count
    player2_score = @cups[13].count

    if player1_score == player2_score
      :draw
    else
      player1_score > player2_score ? @name1 : @name2
    end 
  end
end
