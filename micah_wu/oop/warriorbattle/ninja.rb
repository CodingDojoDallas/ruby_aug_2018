
require_relative "human"

class Ninja < Human
  attr_accessor :stealth
  def initialize
    super
    @stealth = 175
  end
  def HPdecrease(hp)
    if hp == 'all'
      @health = 0
    else
      @health -= hp
    end
    puts "Ninja HP: #{@health}"
    self
  end
  def steal(target)
    puts "Ninja steals health."
    self.attack(target)
    @health += 10
    puts "Ninja HP: #{@health}"
    self
  end
  def escape
    puts "Ninja escapes!"
    @health -= 15
    puts "Ninja HP: #{@health}"
    self
  end
end

ninjaMercer = Ninja.new()
