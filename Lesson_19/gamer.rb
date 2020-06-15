# frozen_string_literal: true

require_relative 'player.rb'

class Gamer < Player
  attr_reader :name

  def gamer_name
    puts 'What is you name?'
    name = gets.chomp
    @name = name
  end

  def move_annotation
    puts 'You move!'
    puts 'What are we doing?'
    puts '1 - Skip move'
    if cards.size < 3
      puts '2 - Add card'
    else
      puts 'Add card is not available'
    end
    puts '3 - Open cards'
  end
end
