

class Game
  attr_accessor :user, :dealer, :deck, :bank

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new
  end

  def round_begin
    bets
    deal
  end

  def bank_show
    "Bank on the table: #{game.bank.bank}"
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

  private

  FIRST_CHOICE = {
      '1' => pass,
      '2' => take_card,
      '3' => :open_cards
  }.freeze

  def first_choice(input)
    send Game::FIRST_CHOICE[input]
  end

  def bets
    bank.bets(user.bet, dealer.bet)
  end

  def deal
    deal_to_user(2)
    deal_to_dealer(2)
  end



  def deal_to_user(quantity = 1)
    user.take_card(deck.deal(quantity))
  end

  def deal_to_dealer(quantity = 1)
    dealer.take_card(deck.deal(quantity))
  end

  def pass
    user.pass = true
    dealer_choice
  end

  def take_card
    deal_to_user
    dealer_choice
  end

  def open_cards

  end

  def dealer_choice
      return dealer.pass= true if dealer.enough?


      take_card
    end

  end










end
