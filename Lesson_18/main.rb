require_relative 'app.rb'

loop do
  app = App.new
  puts 'Hello! Welcome to the game!'
  app.gamer_get_name

  puts 'Give out cards'
  app.start_game
  puts 'Your cards'
  app.gamer_set_cards
  puts 'Your points'
  app.gamer_set_points
  puts 'Dealer cards'
  app.dealer_set_cards
  random = rand(1..2)

  if random == 1
    app.first_case
  elsif random == 2
    app.second_case
  end

  puts "Want to play more?"
  puts "1 - Play!"
  puts "2 - That's enough!"
  choice = gets.chomp.to_i
  if choice == 1
    next
  elsif choice == 2
    break
  end
end
