
require_relative "human"

class Wizard < Human
  def initialize
    super
    @health = 50
    @intelligence = 25
  end
  def HPdecrease(hp)
    if hp == 'all'
      @health = 0
    else
      @health -= hp
    end
    puts "Wizard HP: #{@health}"
    self
  end
  def heal
    puts "Wizard used restoration: failed casting the spell"
    puts "Wizard used restoration: failed casting the spell"
    puts "Wizard used restoration: failed casting the spell"
    puts "Wizard used restoration: failed casting the spell"
    puts "Wizard used restoration: Success!"
    @health += 10
    puts "Wizard HP: #{@health}"
    self
  end
  def fireball(target)
    puts "Wizard Casts Fireball"
    target.HPdecrease(20)
    self
  end
end

wizardDivaythFyr = Wizard.new()
