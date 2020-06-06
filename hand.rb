# frozen_string_literal: true

class Hand
  attr_reader :total_value

  def initialize
    @hand = []
  end

  def take_card(card)
    @hand.concat(card)
# TODO add metod to check if > 21 and include Ace => ace.value = 1
  end

  def show
    @hand.map(&:show) * ', '
  end

  private

  def row_value
    @hand.map(&:value).sum
  end
end
