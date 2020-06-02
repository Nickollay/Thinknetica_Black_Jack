# frozen_string_literal: true

class Hand
  attr_reader :total_value

  def initialize
    @hand = []
  end

  def take_card(card)
    @hand << card
  end

  def show

  end
end
