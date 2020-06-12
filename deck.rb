# frozen_string_literal: true

require_relative './card'

class Deck
  SUITS = ['♥', '♠', '♣', '♦']
  FACES = [*(2..10), 'J', 'Q', 'K', 'A']

  def initialize
    @deck = []
    deck
    @deck.shuffle!.reverse!.shuffle!
  end

  def deal(quantity = 1)
    @deck.pop(quantity)
  end

  private

  def deck
    FACES.each do |face|
      if face.class == Integer
        value = face
      elsif face == 'A'
        value = 11
      else
        value = 10
      end
      SUITS.each do |suit|
        @deck << Card.new(face, suit, value)
      end
    end
  end
end
