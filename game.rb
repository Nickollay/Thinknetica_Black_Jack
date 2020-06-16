

require_relative './interface'

class Game
  attr_accessor :user, :dealer, :deck, :bank
  attr_reader :interface

  def initialize
    @interface = Interface.new
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new
    @round_over = false
    start
  end

  def start
    user.name = interface.set_user
    greetings_message(user.name)
    go
  end



  private

  def go
    first_deal
    next_deal until round_over?
  end

  def first_deal
    round_begin
    interface.deal_message
    interface.status_message(bank_show, user_show, dealer_show)
  end

  def next_deal
    user_choice(interface.user_choice)

    dealer_choice




  end

  def round_begin
    bets
    deal_two_cards
  end

  def bets
    bank.bets(user.bet, dealer.bet)
  end

  def deal_two_cards
    deal_to_user(2)
    deal_to_dealer(2)
  end

  def deal_to_user(quantity = 1)
    user.take_card(deck.deal(quantity))
  end

  def deal_to_dealer(quantity = 1)
    dealer.take_card(deck.deal(quantity))
  end

  FIRST_CHOICE = {
      '1' => :pass,
      '2' => :take_card,
      '3' => :open_cards
  }.freeze

  def user_choice(input)
    send FIRST_CHOICE[input]
  end

  def pass
    interface.pass_message
    user.pass = true
  end

  def take_card
    interface.take_card_message
    deal_to_user
  end

  def open_cards
    interface.open_cards_message
    #TODO add logic

  end

  def bank_show
    "Bank on the table: #{bank.bank}"
  end

  def user_show
    <<-USER_INFO
      #{user.name}:
      Bankroll: #{user.bankroll}
      Cards:    #{user.hand.show}
      Points:   #{user.hand.total_value}
    USER_INFO
  end

  def dealer_show
    <<-USER_INFO
        #{dealer.name}:
        Bankroll: #{dealer.bankroll}
        Cards:    #{dealer.hand.hide}
        Points:   #{dealer.hand.total_value}
    USER_INFO
  end

  def round_over?
    return true if @round_over
    #TODO..other logic
  end




















  private













  def dealer_choice
      return dealer.pass= true if dealer.enough?




      take_card
  end

end











