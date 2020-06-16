# frozen_string_literal: true

require_relative 'hand'
require_relative 'game_over'

class User
  include GameOver

  BET = 10

  attr_accessor :name, :hand, :bankroll
  attr_writer :pass

  def initialize(name = 'Player', bankroll = 100)
    @name = name
    @bankroll = bankroll
    #TODO: plase Hand.new to Game class?
    @hand = Hand.new
    @pass = false
  end

  def bet(bet_size = BET)
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
    raise GameOverError.new, "#{name} is bankrupt." if @bankroll.zero?
  end



end
