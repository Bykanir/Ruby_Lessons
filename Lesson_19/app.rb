# frozen_string_literal: true

require_relative 'requireable'

class App
  attr_reader :gamer, :dealer, :deck, :users, :exit

  def initialize
    @gamer = Gamer.new
    @dealer = Dealer.new
    @deck = Deck.new
    @users = [gamer, dealer]
    @exit = 0
  end

  def start_game
    gamer.gamer_name

    puts 'Give out cards'
    distribution_cards
    puts 'Your cards'
    gamer_set_cards
    puts 'Your points'
    puts gamer.points
    puts 'Dealer cards'
    dealer.hiding_cards
  end

  def first_outcome_game
    loop do
      gamer_move
      break if exit == 1

      dealer.dealer_move
    end
  end

  def second_outcome_game
    loop do
      dealer.dealer_move
      gamer_move
      break if exit == 1
    end
  end

  def play_again
    puts 'Want to play more?'
    puts '1 - Play!'
    puts "2 - That's enough!"
  end

  private

  def gamer_set_cards
    puts gamer.cards.to_s
  end

  def dealer_set_cards
    print dealer.cards
    puts
  end

  def distribution_cards
    users.each do |user|
      2.times { deck.get_card(user) }
    end
    users.each(&:score)
  end

  def gamer_move
    gamer.move_annotation
    gamer_action(gets.chomp.to_i)
  end

  def gamer_action(choice)
    case choice
    when 1
      puts 'You pass'
    when 2
      deck.get_card(gamer)
      puts 'Your cards'
      gamer_set_cards
    when 3
      end_game
    end
  end

  def end_game
    @exit = 1
    users.each(&:score)
    reveal_cards

    return puts 'Dealer won!' if gamer.points > 21
    return puts "#{gamer.name} won!" if dealer.points > 21

    winner
  end

  def winner
    if gamer.points > dealer.points
      puts "#{gamer.name} won!"
    elsif gamer.points < dealer.points
      puts 'Dealer won!'
    else
      puts 'Draw!'
    end
  end

  def reveal_cards
    puts 'Open all cards'
    puts 'Your cards'
    gamer_set_cards
    puts 'Your points'
    puts gamer.points
    puts 'Dealer cards'
    dealer_set_cards
    puts 'Dealer points'
    puts dealer.points
  end
end
