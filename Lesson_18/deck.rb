# + крести clubs
# <3  червы hearts
# ^  пики spades
# <> бубны diamonds

class Deck

  attr_accessor :deck
  attr_reader :points

  def initialize
    cards = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    suits = %w[+ <> ^ <3]
    @deck = []
    cards.each do |card|
      suits.each { |suit| deck << card + suit}
    end
  end

  def get_card(player)
    card = shuffle_deck.sample
    player.cards << card
    delete_card(card)
  end

  private

  def shuffle_deck
    deck.shuffle
  end

  def delete_card(card)               #удаление карты
    deck.delete(card)
  end
end
