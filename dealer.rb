# frozen_string_literal: true

require_relative './user'

class Dealer < User
  def initialize
    super
    @name = 'Dealer'
  end
end
