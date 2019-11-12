

class Player
  attr_accessor :name :lives :turn
  def initialize(name)
    @name
    @lives = 3
   
    #method to decrease lives
    def lose
      self.lives -= 1
    end
end


# determines which player is ther current player
# The current player value will alternate between 0 and 1
class Turn
  def initialize
    @current_player = 0
  end
  def switch
    self.current_player = (self.current_player + 1) % 2
  end