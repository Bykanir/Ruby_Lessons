require_relative 'requireable.rb'

loop do
  app = App.new
  gamer = Gamer.new
  dealer = Dealer.new
  deck = Deck.new

  puts 'Hello! Welcome to the game!'
  gamer.get_name

  puts 'Give out cards'
  app.start_game(gamer, dealer, deck)
  puts 'Your cards'
  p gamer.cards
  puts 'Your points'
  p gamer.points
  puts 'Dealer cards'
  dealer.hiding_cards
  random = rand(1..2)

  if random == 1
    app.first_development(gamer, dealer, deck)
  elsif random == 2
    app.second_development(gamer, dealer, deck)
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
