require_relative 'human'
class Wizard < Human
  def initialize
    super
    @health = 50
    @intel = 25
  end

  def heal
    @health += 10 unless @health >= 50
    puts "You healed yourself to #{!@health}!"
    self
  end

  def fireball object
    object.health -= 20 if object.instance_of? Wizard
    puts "Fireball decreased health to #{object.health}"
    self
  end
end

wiz_stephen = Wizard.new
wiz_scott = Wizard.new.fireball(wiz_stephen)
