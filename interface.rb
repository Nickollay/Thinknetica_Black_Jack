require_relative './game'

class Interface
  include Messages
  attr_accessor :game

  def initialize
    @game = Game.new
    hello
    @game.user.name = gets.chomp
    greetings
    start
  end

  def start


  end


  private

  def exit
    buy
    ###

  end
end
