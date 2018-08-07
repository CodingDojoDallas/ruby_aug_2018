
class Human
  attr_accessor :health
  def initialize
    @health = 100
    @strength = 3
    @intelligence = 3
    @stealth = 3
    self
  end
  def attack(target)
    if target.class.ancestors.include?(Human) == true
      target.HPdecrease(10)
    end
  end
end

class Goblin < Human
  def HPdecrease
    puts "rude goblin is being absentminded"
    puts "human attacks! 20 damage to the rude goblin"
    @health -= 100
    puts "rude goblin HP: #{@health}"
    puts "the rude goblin became tame"
  end
end

#human01 = Human.new()
#goblin01 = Goblin.new()
#human01.attack(goblin01)
