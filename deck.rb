# frozen_string_literal: true

require_relative './card'

class Deck
  SUITS = ['♥', '♠', '♣', '♦'].freeze
  FACES = [*(2..10), 'J', 'Q', 'K', 'A'].freeze

  def initialize
    @deck = []
    deck
    @deck.shuffle!.reverse!.shuffle!
  end

  def deal(quantity = 1)
    @deck.pop(quantity)
  end

  private

  #rubocop:disable all
  def deck
    FACES.each do |face|
      value = if face.class == Integer
                face
              elsif face == 'A'
                11
              else
                10
              end
      SUITS.each do |suit|
        @deck << Card.new(face, suit, value)
      end
    end
  end
  #rubocop:enable all
end
