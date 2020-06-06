# frozen_string_literal: true

class Deck
  attr_accessor :deck
  attr_reader :points

  def initialize
    cards = %w[2 3 4 5 6 7 8 9 10 J Q K A]
    suits = %w[+ <> ^ <3]
    @deck = cards.map do |card|
      suits.map { |suit| card + suit }
    end
    @deck = deck.flatten
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

  def delete_card(card)
    deck.delete(card)
  end
end
