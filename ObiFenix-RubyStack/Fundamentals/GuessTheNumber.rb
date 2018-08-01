require 'inquirer'

def prompt(default, *args)
  print(*args)
  result = gets.strip
  return result.empty? ? default : result
end

def guess_number guessed
    number = 25
    puts "You Got It!"         if guessed.to_i == number
    puts "Guess was too low!"  if guessed.to_i <  number
    puts "Guess was too high!" if guessed.to_i >  number
end

guess = Ask.input "Guess a number from 0 to 100: "
guess_number guess

# Example test:
# ===========================================================
# guess_number 15     # shall test guessed numbers lower than
# guess_number 33     # shall test guessed numbers greater than
# guess_number 25     # shall test guessed numbers that match
# ===========================================================
