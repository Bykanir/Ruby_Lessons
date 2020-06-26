# frozen_string_literal: true

require_relative 'player'

class Gamer < Player
  attr_reader :name

  def initialize
    super
    puts 'Hello! What is you name?'
    name = gets.chomp
    @name = name
  end
end
