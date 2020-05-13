require_relative 'requireable.rb'

class Dealer

  attr_reader :cards
  attr_accessor :point

  def initialize
    @cards = {}
    @point = 0
  end

  def getting_card(cards)
    card = cards.keys.sample
    @cards.store(card, cards[card]) if @cards.size < 3
  end

end
