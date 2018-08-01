class Human
  attr_accessor :health, :stren, :stealth, :intel
  def initialize
    @stren = 3
    @intel = 3
    @stealth = 3
    @health = 100
  end

  def attack object
    object.health -= 10 if object.instance_of? Human
    puts "good job you decreased health to #{object.health}"
    self
  end
end

zack = Human.new
billy = Human.new.attack(zack)
