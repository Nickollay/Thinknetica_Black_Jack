# frozen_string_literal: true

require_relative 'hand'

class User
  attr_accessor :name
  attr_reader :bankroll

  def initialize(name = 'Player', bankroll = 100)
    @name = name
    @bankroll = bankroll
    @hand = Hand.new
  end
end
