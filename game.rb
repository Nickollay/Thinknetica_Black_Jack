

class Game
  attr_accessor :user, :dealer, :deck, :bank

  def initialize
    @user = User.new
    @dealer = Dealer.new
    @deck = Deck.new
    @bank = Bank.new
  end





end
