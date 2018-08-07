
require_relative "human"
require_relative "wizard"
require_relative "ninja"

class Samurai < Human
  @@samuraiArmy = 0
  def initialize
    super
    @health = 200
    @@samuraiArmy +=1
  end
  def HPdecrease(hp)
    if hp == 'all'
      @health = 0
    else
      @health -= hp
    end
    puts "Samurai HP: #{@health}"
    self
  end
  def deathKnell(target)
    puts "You have insulted my footwear."
    puts "Jack used deathKnell"
    target.HPdecrease('all')
    self
  end
  def meditate
    puts "Jack meditates"
    @health = 200
    puts "Samurai HP: #{@health}"
    self
  end
end

samuraiJack = Samurai.new()
ninjaMercer = Ninja.new()
wizardDivaythFyr = Wizard.new()

wizardDivaythFyr.fireball(ninjaMercer).heal
ninjaMercer.steal(wizardDivaythFyr).escape
wizardDivaythFyr.fireball(samuraiJack)
samuraiJack.meditate.deathKnell(wizardDivaythFyr)
