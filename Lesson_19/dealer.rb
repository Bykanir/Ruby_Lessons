# frozen_string_literal: true

require_relative 'player.rb'

class Dealer < Player
  def hiding_cards
    cards.each { print '*' }
    puts
  end
end
