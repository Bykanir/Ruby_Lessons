require_relative 'player.rb'

class Gamer < Player

  attr_reader :name

  def get_name
    puts "What is you name?"
    name = gets.chomp
    @name = name
  end

end
