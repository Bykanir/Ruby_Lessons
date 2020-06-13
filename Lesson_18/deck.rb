# + крести clubs
# <3  червы hearts
# ^  пики spades
# <> бубны diamonds

class Deck
  CARDS = %w[2 3 4 5 6 7 8 9 10 J Q K A]
  SUITS = %w[+ <> ^ <3]

  attr_accessor :deck
  attr_reader :points

  def initialize
    @deck = CARDS.map do |card|
      SUITS.collect { |suit| card + suit}
    end.flatten
  end

  def get_card(player)
    card = deck.sample
    player.cards << card
    delete_card(card)
  end

  private

  def delete_card(card)               #удаление карты
    deck.delete(card)
  end
end
