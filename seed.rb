require_relative './user'
require_relative './dealer'
require_relative './card'
require_relative './deck'
require_relative './bank'
require_relative './hand'


d = Deck.new
h = Hand.new
h.take_card(d.deal(8))
# puts h.ace?
dealer = Dealer.new
p dealer.inspect
user = User.new
dealer.pass = true
p dealer.inspect

p User::

# p d.deal.face

