# frozen_string_literal: true

require_relative 'player.rb'

class Gamer < Player
  attr_reader :name

  def name?
    puts 'What is you name?'
    name = gets.chomp
    @name = name
  end
end
