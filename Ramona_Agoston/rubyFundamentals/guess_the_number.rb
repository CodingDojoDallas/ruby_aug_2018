# Let's put our understanding of conditionals to the test. We're going to create a simple method with one input. Our method will be called guess_number and the input will be our guess. There will be three possible outcomes to this method.
#
# The user guessed correctly, return "You got it!"
# The guess was too high, return "Guess was too high!"
# The guess was too low, return "Guess was too low!"

def guess_number guess
    number = 25
    if number == guess
        puts "You got it!"
    elsif number > guess
        puts "Guess was too high!"
    else number < guess
        puts "Guess was too low!"
    end
end

guess_number 10
guess_number 30
guess_number 25
