require_relative 'player.rb'

class Dealer < Player
  def hiding_cards
    puts "#{cards.map { '* ' }}"
  end
end
