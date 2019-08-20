require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")

LANGUAGE = "en"

def messages(message, lang="en")
  MESSAGES[lang][message]
end

def valid_number?(num)
  num.to_s == num.to_i.to_s || num.to_s == num.to_f.to_s
end

def valid_operator(input)
  input.to_i != 0
end

# puts "Welcome to the Calculator!"
puts messages("welcome")

answer = ""
loop do
  # break if answer == 2
  number1 = ""
  loop do
    puts messages("first_number")
    number1 = gets.chomp

    if valid_number?(number1)
      break
    else
      puts messages("number_error")
    end
  end
  
  number2 = ""
  loop do
    puts messages("second_number")
    number2 = gets.chomp

    if valid_number?(number2)
      break
    else
      puts messages("number_error")
    end
  end

  operator = ""

  puts messages("operation")
  puts messages("add")
  puts messages("subtract")
  puts messages("multiply")
  puts messages("divide")

  loop do
    operator = gets.chomp.to_i
    if valid_operator(operator)
      break
    else
      puts messages("operator_error")
    end
  end

  result = case operator
           when 1
             number1.to_f + number2.to_f
           when 2
             number1.to_f - number2.to_f
           when 3
             number1.to_f * number2.to_f
           when 4
             number1.to_f / number2.to_f
           else
             puts messages("invalid")
           end

  operation = case operator
              when 1
                messages("adding")
              when 2
                messages("subtracting")
              when 3
                messages("multiplying")
              when 4
                messages("dividing")
              else
                puts messages("invalid")
              end
  
  # x = "A randome line of code"

  puts "#{operation} #{number1} & #{number2}..."
  puts "Result => #{result}"
  
  puts messages("prompt")
  puts messages("yes_again")
  puts messages("no_stop")
  answer = gets.chomp
  break unless answer.to_i == 1 || answer.downcase == "yes"
end

puts messages("bye")

=begin
blurb = <<-TXT
--------------------------------------------------------------------------------
Lesson 2: Small Programs
Refactoring Calculator
--------------------------------------------------------------------------------
TXT

puts blurb
=end