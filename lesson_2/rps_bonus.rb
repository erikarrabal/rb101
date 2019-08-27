VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == "rock" && (second == "scissors" || second == "lizard")) ||
    (first == "paper" && (second == "rock" || second == "spock")) ||
    (first == "scissors" && (second == "paper" || second == "lizard")) ||
    (first == "lizard" && (second == "spock" || second == "paper")) ||
    (first == "spock" && (second == "scissors" || second == "rock"))
end

def display_results(player, computer)
  if win?(player, computer)
    "You won!"
  elsif win?(computer, player)
    "You lost!"
  else
    "It's a tie!"
  end
end

def convert_to_s(input)
  case input
  when "r"
    input = "rock"
  when "p"
    input = "paper"
  when "s"
    input = "scissors"
  when "k"
    input = "spock"
  when "l"
    input = "lizard"
  end
end

wins = 0
losses = 0

loop do
  short_choice = ""
  choice = ""

  loop do
    prompt("Choose: r = rock, p = paper, s = scissors, k = spock, l = lizard")
    short_choice = gets.chomp
    
    choice = convert_to_s(short_choice)

    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice.")
    end
  end

  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{choice}; The computer chose: #{computer_choice}."

  prompt display_results(choice, computer_choice)
  
  if win?(choice, computer_choice)
    wins += 1
  elsif win?(computer_choice, choice)
    losses += 1
  end
  
  prompt("Your wins: #{wins}; Computer wins: #{losses}")
  
  if wins >= 5 
    prompt("You are the grand winner.")
    break
  elsif losses >= 5
    prompt("The computer is the grand winner.")
    break
  end

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt("Thanks for playing. Good bye!")