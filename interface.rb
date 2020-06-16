# frozen_string_literal: true

require_relative 'messages'

class Interface
  include Messages

  def initialize; end

  def set_user
    hello_message
    gets.chomp
  end

  def status_message(bank_show, user_show, dealer_show)
    puts bank_show
    puts user_show
    puts dealer_show
  end

  def user_choice
    puts user_choices_message
    gets.chomp
  end


  # def input
  #   @input = gets.chomp
  # end
end
