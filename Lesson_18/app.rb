class App

  def start_game(gamer, dealer, deck)                     #раздача карт игроку
    deck.get_card(gamer)
    deck.get_card(gamer)

    deck.get_card(dealer)
    deck.get_card(dealer)
  end


  def gamer_move_annotation_first
    puts "You move!"
    puts "What are we doing?"
    puts "1 - Add card"
    puts "2 - Open cards"
  end

  def gamer_move_first(gamer, move, deck, dealer)             #ход игрока
    if move == 1
      deck.get_card(gamer)
      puts "Your cards"
      p gamer.cards
    elsif move == 2
      return
    end
  end

  def first_development(gamer, dealer, deck)
    dealer_move(dealer, deck)

    gamer_move_annotation_first
    move = gets.chomp.to_i
    gamer_move_first(gamer, move, deck, dealer)

    win(gamer, dealer)
  end

  def gamer_move_annotation_second
    puts "You move!"
    puts "What are we doing?"
    puts "1 - Skip move"
    puts "2 - Add card"
    puts "3 - Open cards"
  end

  def gamer_move_second(gamer, move, deck, dealer)             #ход игрока
    if move == 1
      puts "Pass"
    elsif move == 2
      deck.get_card(gamer)
      puts "Your cards"
      p gamer.cards
    end
  end

  def second_development(gamer, dealer, deck)
    gamer_move_annotation_second
    move = gets.chomp.to_i
    gamer_move_second(gamer, move, deck, dealer)

    return win(gamer, dealer) if move == 3

    dealer_move(dealer, deck)

    win(gamer, dealer)
  end


  def dealer_move(dealer, deck)                    #ход дилера
    puts "Dealer move"
    if dealer.points < 17
      puts "Dealer draws card"
      deck.get_card(dealer)
      puts "Dealer cards"
      dealer.hiding_cards
    else
      puts "Dealer pass"
    end
  end

  def win(gamer, dealer)
    gamer.score
    dealer.score
    all_out(gamer, dealer)

    return puts "Dealer won!" if gamer.points > 21
    return puts "#{gamer.name} won!" if dealer.points > 21

    winner(gamer, dealer)
  end

  private

  def winner(gamer, dealer)
    if gamer.points > dealer.points
      puts "#{gamer.name} won!"
    elsif gamer.points < dealer.points
      puts "Dealer won!"
    else
      puts "Draw!"
    end
  end

  def all_out(gamer, dealer)        #вывод всех карт и очков
    puts "Open all cards"
    puts "Your cards"
    p gamer.cards
    puts "Your points"
    p gamer.points

    puts "Dealer cards"
    p dealer.cards
    puts "Dealer points"
    p dealer.points
  end
end
