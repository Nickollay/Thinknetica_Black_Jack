# frozen_string_literal: true

class Bank
  attr_reader :bank

  def initialize
    @bank = 0
  end

  def bets(*args)
    args.each { |arg| @bank += arg }
  end

  def prize(divider = 1)
    prize = @bank / divider
    @bank -= prize
    prize
  end
end
