require_relative 'player.rb'

class Dealer < Player
  def hiding_cards
    cards.size.times { p ' * '}
  end
end
