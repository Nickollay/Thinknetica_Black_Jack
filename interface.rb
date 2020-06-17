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
    border
    puts bank_show
    line
    puts user_show
    line
    puts dealer_show
    border
  end

  def wins_status_message(wins_status)
    puts wins_status
  end

  def user_choice
    puts user_choices_message
    input
  end

  def new_round
    new_round_message
    input
  end

  def input
    @input = gets.chomp
  end
end
