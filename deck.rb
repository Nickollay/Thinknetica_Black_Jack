class Deck

  def initialize
    suits = ['♥', '♠', '♣', '♦']
    faces = [*(1..10), 'J', 'Q', 'K', 'A']

    suits.product.shuffle.reverse.shuffle
  end

end