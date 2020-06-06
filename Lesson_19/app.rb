# frozen_string_literal: true

require_relative 'requireable.rb'

class App
  attr_reader :gamer, :dealer, :deck, :users

  def initialize
    @gamer = Gamer.new
    @dealer = Dealer.new
    @deck = Deck.new
    @users = [gamer, dealer]
  end

  def gamer_get_name
    gamer.name?
  end

  def gamer_set_cards
    print gamer.cards
    puts
  end

  def gamer_set_points
    puts gamer.points
  end

  def dealer_set_cards
    dealer.hiding_cards
  end

  def start_game
    users.each do |user|
      2.times { deck.get_card(user) }
    end
    users.each(&:score)
  end

  def first_case
    dealer_move

    gamer_move_annotation_first
    choice = gets.chomp.to_i
    gamer_move_first_case(choice)

    end_game
  end

  def gamer_move_annotation_first
    annotation = ['You move!',
                  'What are we doing?',
                  '1 - Add card',
                  '2 - Open cards']
    annotation.each { |ann| puts ann }
  end

  def gamer_move_first_case(choice)
    if choice == 1
      deck.get_card(gamer)
      puts 'Your cards'
      gamer_set_cards
    elsif choice == 2
      nil
    end
  end

  def second_case
    gamer_move_annotation_second
    choice = gets.chomp.to_i
    gamer_move_second_case(choice)

    return end_game if choice == 3

    dealer_move

    end_game
  end

  def gamer_move_annotation_second
    annotation = ['You move!',
                  'What are we doing?',
                  '1 - Skip move',
                  '2 - Add card',
                  '3 - Open cards']
    annotation.each { |ann| puts ann }
  end

  def gamer_move_second_case(choice)
    if choice == 1
      puts 'Pass'
    elsif choice == 2
      deck.get_card(gamer)
      puts 'Your cards'
      gamer_set_cards
    end
  end

  def dealer_move
    puts 'Dealer move'
    if dealer.points < 17
      puts 'Dealer draws card'
      deck.get_card(dealer)
      puts 'Dealer cards'
      dealer.hiding_cards
    else
      puts 'Dealer pass'
    end
  end

  def end_game
    users.each(&:score)
    reveal_cards

    return puts 'Dealer won!' if gamer.points > 21
    return puts "#{gamer.name} won!" if dealer.points > 21

    winner
  end

  private

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
    annotation = ['Open all cards',
                  'Your cards',
                  gamer.cards,
                  'Your points',
                  gamer.points,
                  'Dealer cards',
                  dealer.cards,
                  'Dealer points',
                  dealer.points]
    annotation.each { |ann| puts ann }
  end
end
