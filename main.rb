class Game
  #initialze 2 players
  #be able to get the name of both players
  attr_accessor :players, :turn

  def initialize
    @players = [
      Player.new("Player1"),
      Player.new("Player2")
    ]
    @turn = 0

    match()
  end

  # private
  
  def match()
    question = Question.new

    question.ask_player(current_player)
    input = gets.chomp
    
    is_correct = question.check(input)

    if is_correct == false
      current_player.lose
    end

    # print the score
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
    # do a check to see if lives are 0 to end the game
    # if (@player1.lives} == 0 || {@player2.lives} == 0)
    #   puts "winning player wins with a score of #{}/3"
    #   puts "----- GAME OVER -----"
    # else
    puts "----- NEW TURN ----- "
    # switch players and call another match asking player 2
    # new_turn = Turn.new
    # new_turn.switch
    if @turn = 0
      @turn = 1
    else
      @turn = 0
    end
  end

  def current_player
    @players[@turn]
  end

end

class Player
  attr_accessor :name, :lives
  def initialize(name)
    @name = name
    @lives = 3
  end
   
  #method to decrease lives
  def lose
    self.lives -= 1
  end
end

# determines which player is ther current player
# The current player value will alternate between 0 and 1
# class Turn
#   def initialize
#     @current_player = 0
#   end
#   def switch
#     self.current_player = (self.current_player + 1) % 2
#   end
# end

# Generates the 2 random numbers in the question
class Question
  attr_accessor :n1, :n2
  
  def initialize
    @n1 = rand(1..20)
    @n2 = rand(1..20)
  end
  # generate question: What does #{self.n1} plus #{self.n2} equal?
  def ask_player(player)
    puts "#{player.name}: What does #{self.n1} plus #{self.n2} equal?"
  end

  #check if the user input == self.n1+self.n2
  def check(input)
    result = true

    # if input from the player does not equal the sum, then put and call the player.lose method
    if input.to_i != (self.n1 + self.n2)
      puts "Seriously? No!"
      result = false
    else
      puts "YES! You are correct."
    end

    result
  end

end