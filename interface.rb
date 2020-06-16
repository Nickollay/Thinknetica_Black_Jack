# frozen_string_literal: true

require_relative './game'

class Interface
  include Messages
  attr_accessor :game

  def initialize
    @game = Game.new
    hello_message
    @game.user.name = gets.chomp
    greetings_message
    start
  end

  def start
    round_begin
    deal_message
    puts bank_show
    puts user_show
    puts dealer_show
    puts first_choice_message
    input
    input_message
    first_choice(@input)


    private

    def input
      @input = gets.chomp
    end

    def input_message
      return pass_message if @input == '1'

      return take_card_message if @input == '2'

      return open_cards_message if @input == '3'

      puts 'You can input only: 1, 2, 3'
      input
      input_message
    end













  rescue StandardError => e
    puts e.message
  end


  private


  def exit
    buy_message
    ###

  end
end
