

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
