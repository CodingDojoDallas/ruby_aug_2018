def guess_number guess
  number = 25
  unless guess == number
    if guess > number
      return "Guess was too high!"
    elsif guess < number
      return "Guess was too low!"
    end
  else
    puts "You got it!"
  end
end

puts guess_number 77
