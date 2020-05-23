require_relative 'player.rb'

class Dealer < Player
  def hiding_cards
    hiding = []
    @cards.size.times { hiding << '**'}
    p hiding
  end
end
