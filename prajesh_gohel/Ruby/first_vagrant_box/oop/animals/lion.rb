require_relative 'mammal'
class Lion < Mammal
  def initialize health=170
    super
  end

  def display_health
    puts "This is a lion!"
    super
  end

  def fly
    @health -= 10
    self
  end

  def attack_town
    @health -= 50
    self
  end

  def eat_humans
    @health += 20
    self
  end
end

simba = Lion.new.attack_town.attack_town.attack_town.eat_humans.eat_humans.fly.fly.display_health
