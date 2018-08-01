require_relative 'human'
class Ninja < Human
  def initialize
    super
    @stealth = 175
  end

  def steal object
    @health += 10 unless @health >= 100
    puts "You steal a potion and increase health to #{@health}"
    self
  end

  def get_away
    @health -= 15
    puts "You get away, but your health decreases to #{@health}"
    self
  end
end

ninja_stephen = Ninja.new
ninja_scott = Ninja.new.steal(ninja_stephen).get_away
