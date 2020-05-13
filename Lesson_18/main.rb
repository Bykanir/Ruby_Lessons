require_relative 'requireable.rb'

app = App.new
gamer = Gamer.new
dealer = Dealer.new

puts "Hello"
app.get_name(gamer)

puts "Give out cards"
app.start_game(gamer)
app.score(gamer)
puts "Your cards"
app.output_card(gamer)
puts "Your points"
app.output_score(gamer)


app.start_game(dealer)
app.score(dealer)
puts "Cards dealer ** **"

random = rand(1..2)

if random == 1
  app.dealer_move(dealer)

  app.gamer_move_annotation                           #
  choice = gets.chomp.to_i
  return app.win(gamer, dealer) if choice == 3
  app.gamer_choice(gamer, choice)

elsif random == 2
  app.gamer_move_annotation
  choice = gets.chomp.to_i
  return app.win(gamer, dealer) if choice == 3
  app.gamer_choice(gamer, choice)

  app.dealer_move(dealer)

end

app.win(gamer, dealer)
