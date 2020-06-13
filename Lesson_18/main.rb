require_relative 'app.rb'

loop do
  app = App.new
  puts 'Hello! Welcome to the game!'
  app.start_game

  random = rand(1..2)

  if random == 1
    app.first_outcome_game
  elsif random == 2
    app.second_outcome_game
  end

  app.play_again == 1 ? next : break
end
puts 'Good bay!'
