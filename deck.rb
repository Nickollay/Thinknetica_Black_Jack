# frozen_string_literal: true

class Deck
  require_relative './card'

  SUITS = ['♥', '♠', '♣', '♦']
  FACES = [*(2..10), 'J', 'Q', 'K', 'A']

  def initialize
    @deck = []

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
    @deck.shuffle!.reverse!.shuffle!
  end

  def deal

  end

end
