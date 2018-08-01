class User
  # creating instance methods that get and set the first and last name attributes
  attr_accessor :first_name, :last_name

  def initialize(f_name, l_name)
    @first_name = f_name
    @last_name = l_name
  end

  def full_name
    puts "I am #{@first_name} #{@last_name}"
  end

  def say_hello
    puts "Hello"
  end

  def self.foo
    puts "This is a class method"
  end
end

pj = User.new("Prajesh", "Gohel")
pj.full_name
pj.say_hello
User.foo
