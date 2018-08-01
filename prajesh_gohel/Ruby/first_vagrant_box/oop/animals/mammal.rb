class Mammal
  def initialize health=150
    @health = health
  end

  def display_health
    puts "Health: #{@health}"
    self
  end
end

# cheetah = Mammal.new
# cheetah.display_health
