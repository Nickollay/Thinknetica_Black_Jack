

require_relative 'interface'
require_relative 'user'
require_relative 'hand'
require_relative 'dealer'
require_relative 'deck'
require_relative 'bank'
require_relative 'game_over'

class Game
  include GameOver

  attr_accessor :user, :dealer, :deck, :bank, :wins
  attr_reader :interface

  def initialize
    @interface = Interface.new
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new
    @round_over = false
    @wins = { user: 0, dealer: 0 }
    start
  end

  private

  def start
    user.name = interface.set_user
    interface.greetings_message(user.name)
    game
  end

  def game
    go
    winner
    new_round(interface.new_round)
  rescue GameOverError => e
    puts e.message
    quit
  end

  def go
    first_deal
    next_deal until open_cards?
  end

  def first_deal
    round_begin
    interface.deal_message
    status
  end

  def status
    interface.status_message(bank_show, user_show, dealer_show)
  end

  def next_deal
    user_choice(interface.user_choice)
    dealer_choice
    status
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

  USER_CHOICE = {
      '1' => :pass,
      '2' => :take_card,
      '3' => :open_cards
  }.freeze

  def user_choice(input)
    send USER_CHOICE[input]
  end

  def pass
    interface.pass_message
    user.pass = true
  end

  def take_card
    interface.take_card_message
    deal_to_user
  end

  def dealer_take_card
    deal_to_dealer
    interface.dealer_take_card_message
  end

  def dealer_pass
    dealer.pass = true
    interface.dealer_pass_message
  end

  def open_cards
    interface.open_cards_message
    @round_over = true
  end

  def open_cards?
    return true if @round_over || both_passed? || both_have_three_cards? || limit_moves?

    false
  end

  def both_passed?
    user.pass? && dealer.pass?
  end

  def both_have_three_cards?
    user.hand.size_three? && dealer.hand.size_three?
  end

  def limit_moves?
    user.hand.size_three? && dealer.pass?
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
      Wins:     #{wins[:user]}
    USER_INFO
  end

  def dealer_show
    <<-USER_INFO
      #{dealer.name}:
      Bankroll: #{dealer.bankroll}
      Cards:    #{open_cards? ? dealer.hand.show : dealer.hand.hide}
      Points:   #{open_cards? ? dealer.hand.total_value : '**'}
      Wins:     #{wins[:dealer]}
    USER_INFO
  end

  def wins_status
    <<-WINS
      #{dealer.name} wins: #{wins[:dealer]} times
      #{user.name} wins: #{wins[:user]} times
    WINS
  end

  def dealer_choice
    if dealer.enough?
      dealer_pass
    else
      dealer_take_card
    end
  end

#TODO: refactor method winner later
  def winner
    if user_overtook? && dealer_overtook?
      tie
    elsif user_overtook?
      dealer_wins
    elsif dealer_overtook?
      user_wins
    elsif user_have_more_points?
      user_wins
    elsif dealer_have_more_points?
      dealer_wins
    else
      tie
    end
    status
  end

  def dealer_wins
    interface.dealer_wins_message
    winner_prize(dealer)
    wins[:dealer] += 1
  end

  def user_wins
    interface.user_wins_message(user.name)
    winner_prize(user)
    wins[:user] += 1
  end

  def tie
    interface.tie_massage
    tie_prize
  end

  def winner_prize(player)
    player.bankroll += bank.prize
  end

  def tie_prize
    tie_prize_each = bank.prize(2)
    user.bankroll += tie_prize_each
    dealer.bankroll += tie_prize_each
  end

  def user_points
    user.hand.total_value
  end

  def dealer_points
    dealer.hand.total_value
  end

  def user_overtook?
    user_points > 21
  end

  def dealer_overtook?
    dealer_points > 21
  end

  def user_have_more_points?
    user_points > dealer_points
    end

  def dealer_have_more_points?
    user_points < dealer_points
  end

  def new_round(input)
    send NEW_ROUND[input]
  end

  NEW_ROUND = {
      '1' => :new_game,
      '2' => :quit
  }.freeze

  def quit
    interface.wins_status_message(wins_status)
    interface.buy_message
    sleep(2)
    exit(0)
  end

  def new_game
    erase_data
    game
  end

  def erase_data
    @deck = Deck.new
    user.hand = Hand.new
    dealer.hand = Hand.new
    user.pass = false
    dealer.pass = false
    @round_over = false
  end
end
