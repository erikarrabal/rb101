def prompt(message)
  puts "=> #{message}"
end

prompt("Welcome to the Mortage Calculator!")
prompt("----------------------------------")

loop do
  prompt("What is the loan amount?")
  amount = ""
  
  loop do
    amount = gets.chomp
    
    if amount.empty?
      puts "EMPTY ERROR... Please enter a positive integer for the loan amount:"
    elsif amount.to_i < 0
      puts "NEGATIVE ERROR... Please enter a positive integer for the loan amount:"
    elsif amount.to_s != amount.to_i.to_s
      puts "STRING ERROR... Please enter a positive integer for the loan amount:"
    else
      break
    end
  end
  
  prompt("What is the interest rate?")
  prompt("(example: for 3.9% enter 3.9)")
  interest_rate = ""
  
  loop do
    interest_rate = gets.chomp
    
    if interest_rate.empty?
      puts "EMPTY ERROR... Please enter a positive integer for the interest rate:"
    elsif interest_rate.to_f < 0
      puts "NEGATIVE ERROR... Please enter a positive integer for the interest rate:"
    elsif interest_rate.to_s != interest_rate.to_i.to_s
      puts "STRING ERROR... Please enter a postive integer for the interest rate:"
    else
      break
    end
  end
  
  prompt("What is the loan duration (in years)?")
  years = ""
  
  loop do
    years = gets.chomp
    
    if years.empty?
      puts "EMPTY ERROR... Please enter a positive integer for the duration:"
    elsif years.to_i < 0
      puts "NEGATIVE ERROR... Please enter a positive integer for the duration:"
    elsif years.to_s != years.to_i.to_s
      puts "STRING ERROR... Please enter a positive integer for the duration:"
    else
      break
    end
  end
  
  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i * 12
  
  payment = amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-months)))
  
  prompt("Your monthly payment is: $#{format("%0.2f", payment)}")
  
  prompt("Would you like to run another calculation?")
  answer = gets.chomp
  
  break unless answer.start_with?("y")
end

prompt("Thanks for using the Mortage Calculator.")
prompt("Good bye!")