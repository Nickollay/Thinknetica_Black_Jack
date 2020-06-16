module Messages
  def greetings_message(user_name)
    puts "#{user_name} welcome to Casino BJ!"
    puts "Let's play Black Jack game!"
  end

  def hello_message
    puts 'Hello! What is your name?'
  end

  def buy_message
    puts 'Good buy!'
  end

  def deal_message
    puts 'Wait for a moment while Dealer deals.'
    sleep(2)
  end

  def user_choices_message
    puts <<-CHOICE
      Enter:
      1. Pass
      2. Take card
      3. Open cards
    CHOICE
  end

  def pass_message
    puts "You've passed"
  end

  def take_card_message
    puts "You've taken card"
  end

  def open_cards_message
    puts "You've chosen to open cards"
  end

  def dealer_wins_message
    puts 'Dealer wins! You loose.'
  end

  def user_wins_message(user_name)
    puts "#{user_name}, congratulations? you win!"
  end

  def tie_massage
    puts 'This round of Black Jack ends in a Tie!'
  end

end
