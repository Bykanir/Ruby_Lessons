# frozen_string_literal: true

require_relative 'app'

loop do
  puts 'Hello! What is you name?'
  app = App.new
  puts 'Welcome to the game!'
  app.start_game

  random = rand(1..2)

  app.game(random)

  app.play_again
  gets.chomp.to_i == 1 ? next : break
end
puts 'Good bay!'
