# frozen_string_literal: true

require_relative './user'

class Dealer < User
  def initialize
    super
    @name = 'Dealer'
  end


  # def pass?
  #   return true if enough?
  #
  #   super
  # end
  #
  # #TODO: maybe put it to Modole dealer choice or to Dealer
  #   def dealer_choice
  #     return pass if enough?
  #     #TODO: or to Dealer and move logic take card from hand to user!!!
  #     take_card
  #   end
  #
  #   private
  #
  #   def enough?
  #     @hand.total_value >= 17
  #   end
  #
  #

  private

  def enough?
    hand.total_value >= 17
  end
end
