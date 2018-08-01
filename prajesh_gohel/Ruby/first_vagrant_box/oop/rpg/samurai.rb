require_relative 'human'
class Samurai < Human
  @@count = 0
  def initialize
    super
    @health = 200
    @@count += 1
  end

  def death_blow object
    object.health = 0 if object.instance_of Samurai
    puts "Death Blow! Health decreased to #{object.health}"
  end

  def meditate
    @health = 200
    puts "Meditate increased health to max (#{@health})!"
  end

  def how_many
    puts "There are #{@@count} samurais"
  end
end
