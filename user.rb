# frozen_string_literal: true

require_relative 'hand'

class User
  attr_accessor :name, :hand
  attr_writer :pass
  attr_reader :bankroll

  def initialize(name = 'Player', bankroll = 100)
    @name = name
    @bankroll = bankroll
    @hand = Hand.new
    @pass = false
  end

  def bet(bet_size = 10)
    bankrupt!
    @bankroll -= bet_size
    bet_size
  end

  def pass?
    @pass
  end

  def take_card(card)
    hand.take_card(card)
  end

  private

  def bankrupt!
    raise StandardError, "#{name} is bankrupt." if @bankroll.zero?
  end


end
