# frozen_string_literal: true

require_relative 'player.rb'
require_relative 'deck.rb'

class Dealer < Player
  def hiding_cards
    puts (cards.map { '* ' }).to_s
  end

  def dealer_move
    puts 'Dealer move'
    if points < 17 && cards.size < 3
      puts 'Dealer draws card'
      deck.get_card(dealer)
      puts 'Dealer cards'
      hiding_cards
    else
      puts 'Dealer pass'
    end
  end
end
