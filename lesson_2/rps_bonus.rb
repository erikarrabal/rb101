VALID_CHOICES = %w(rock paper scissors spock lizard)

def prompt(message)
  puts "=> #{message}"
end

def convert_to_s(input)
  case input
  when "r"
    "rock"
  when "p"
    "paper"
  when "s"
    "scissors"
  when "k"
    "spock"
  when "l"
    "lizard"
  end
end

def player_move
  prompt("Pick one: r = rock, p = paper, s = scissors, k = spock, l = lizard")
  short_choice = gets.chomp

  choice = convert_to_s(short_choice)

  if VALID_CHOICES.include?(choice)
    choice
  else
    prompt("That's not a valid choice.")
  end
end

WINNING_MOVES = {
  "rock": ["scissors", "lizard"],
  "paper": ["rock", "spock"],
  "scissors": ["paper", "lizard"],
  "lizard": ["spock", "paper"],
  "spock": ["scissors", "rock"]
}

def win?(first, second)
  WINNING_MOVES[first.to_sym].include?(second)
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

def clear
  system('clear') || system('cls')
end

prompt("Hi stranger! What's your first name?")
first_name = gets.chomp
prompt("Nice to meet you #{first_name}! Let's cover the rules...")
prompt("You have five choices: rock, paper, scissors, spock, or lizard.")
prompt("The first player to win 5 times is the grand winner! Ready to play?")

wins = 0
losses = 0

loop do
  player_choice = player_move
  computer_choice = VALID_CHOICES.sample

  puts "You chose: #{player_choice}; The computer chose: #{computer_choice}."

  prompt display_results(player_choice, computer_choice)

  if win?(player_choice, computer_choice)
    wins += 1
  elsif win?(computer_choice, player_choice)
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

  prompt("Do you want to play again? Type \"yes\" to continue!")
  answer = gets.chomp
  break unless answer.downcase.include?("yes")

  clear
end

prompt("Thanks for playing. Good bye!")
