VALID_CHOICES = ["rock", "paper", "scissors"]

def test_method
  prompt("test message")
end

def prompt(message)
  puts "=> #{message}"
end

def display_results(player, computer)
  if (player == "rock" && computer == "scissors") ||
     (player == "paper" && computer == "rock") ||
     (player == "scissors" && computer == "paper")
    return "You won!"
  elsif (player == "rock" && computer == "paper") ||
        (player == "paper" && computer == "scissors") ||
        (player == "scissors" && computer == "rock")
    return "You lost!"
  else
    return "It's a tie!"
  end
end

loop do
  choice = ""
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; The computer chose: #{computer_choice}."

  prompt (display_results(choice, computer_choice))

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thanks for playing. Good bye!")
