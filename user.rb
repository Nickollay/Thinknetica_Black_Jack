# frozen_string_literal: true

class User
  require_relative 'hand'
  attr_accessor :name
  attr_reader :bankroll

  def initialise(name = 'Player', bankroll = 100)
    @name = name
    @bankroll = bankroll
    @hand = Hand.new
  end

end
