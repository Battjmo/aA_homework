class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end

  def play
    system "clear"
    puts "Welcome to Simon!"
    sleep(2)
    take_turn until game_over
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    self.sequence_length += 1
    round_success_message(require_sequence)
  end

  def show_sequence
    add_random_color
    system "clear"
    seq.each do |color|
      print color
      sleep(1)
      system "clear"
      sleep(1)
    end
  end

  def require_sequence
    puts "Repeat the sequence below (color,color,color):"
    answer = gets.chomp.split(",")
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message(answer)
    if seq == answer
      puts "YOU WIN THIS ROUND! GET READY FOR THE NEXT ONE!"
      sleep(3)
    else
      self.game_over = true
    end
  end

  def game_over_message
    puts "GAME OVER! PLEASE TRY AGAIN."
  end

  def reset_game
    self.sequence_length = 1
    self.seq = []
    self.game_over = false
  end


end
