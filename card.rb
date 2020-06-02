# frozen_string_literal: true

class Card
  attr_accessor :value
  attr_reader :suit, :face

  def initialize(face, suit, value)
    @value = value
    @suit = suit
    @face = face
  end
end
