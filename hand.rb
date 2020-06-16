# frozen_string_literal: true

class Hand
  attr_reader :total_value


  def initialize
    @hand = []
    @total_value = 0
  end

  def take_card(card)
    @hand.concat(card)
    row_value
    ace_21_checker!
  end

  def show
    @hand.map(&:show) * ', '
  end

  def hide
    @hand.map(&:hide) * ', '
  end

  def size_three?
    @hand.count == 3
  end

  private

  def row_value
    @total_value = @hand.map(&:value).sum
  end

  def ace_21_checker!
    @total_value -= 10 if twenty_one? && ace?
  end

  def twenty_one?
    @total_value >= 21
  end

  def ace?
    (@hand.map(&:face) * ',').include? 'A'
  end
end
