def prompt(message)
  puts "=> #{message}"
end

loop do
  prompt("Welcome to the Mortage Calculator!")
  prompt("----------------------------------")
  
  prompt("What is the loan amount?")
  
  amount = ""
  loop do
    amount = gets.chomp
    
    if amount.empty?
      prompt("ERROR: No input detected... Please enter a positive integer:")
    elsif amount.to_s != amount.to_i.to_s
      prompt("ERROR: String detected... Please enter a positive integer:")
    elsif amount.to_f < 0
      prompt("ERROR: Negative detected... Please enter a positive integer:")
    else
      break
    end
  end
  
  prompt("What is the interest rate?")
  prompt("(Example: 2 for 2% or 7.5 for 7.5%)")
  
  interest_rate = ""
  loop do
    interest_rate = gets.chomp
    
    if interest_rate.empty?
      prompt("ERROR: No input detected... Please enter a positive integer:")
    elsif interest_rate.to_f != interest_rate.to_i.to_f
      prompt("ERROR: String detected... Please enter a positive integer:")
    elsif interest_rate.to_f < 0
      prompt("ERROR: Negative detected... Please enter a positive integer:")
    else
      break
    end
  end
  
  prompt("What is the loan duration (in years)?")
  
  years = ""
  loop do
    years = gets.chomp
    
    if years.empty?
      prompt("ERROR: No input detected... Please enter a positive integer:")
    elsif interest_rate.to_s != interest_rate.to_f.to_s
      prompt("ERROR: String detected... Please enter a positive integer:")
    elsif interest_rate.to_f < 0
      prompt("ERROR: Negative detected... Please enter a positive integer:")
    else
      break
    end
  end
  
  annual_interest_rate = interest_rate.to_f / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = years.to_i * 12
  
  monthly_payment = amount.to_f * (monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-months)))
  
  prompt("Your monthly payment is: $#{format('%0.2f', monthly_payment)}")
  
  prompt("Another calculation?")
  answer = gets.chomp
  
  break unless answer.downcase.start_with?("y")
end

prompt("Thank you for using the Mortage Calculator.")
prompt("Goodbye!")