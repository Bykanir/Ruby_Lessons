# frozen_string_literal: true

require_relative 'requireable.rb'

class Gamer
  attr_reader :cards, :name
  attr_accessor :point

  def initialize
    @cards = {}
    @point = 0
  end

  def enter_name
    name = gets.chomp
    @name = name
  end

  def getting_card(cards)
    card = cards.keys.sample
    @cards.store(card, cards[card]) if @cards.size < 3
  end
end
