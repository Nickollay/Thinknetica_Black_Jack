# frozen_string_literal: true


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
    input
  end



  # def start





    input_message
    game.first_choice(@input)


    private

    def input
      @input = gets.chomp
    end





    # FIRST_CHOISE_LOGIC = {
    #     '1' => :pass,
    #     '2' => :take_card,
    #     '3' => :open_cards
    # }

      puts 'You can input only: 1, 2, 3'
      input
      input_message
    end













  # rescue StandardError => e
  #   puts e.message
  # end


  private


  def exit
    buy_message
    ###

  end
end
