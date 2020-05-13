require_relative 'requireable.rb'

class App

  attr_reader :cards

  def initialize
    # + крести clubs
  # <3  червы hearts
  # ^  пики spades
  # <> бубны diamonds


    @cards = { :'2+' => 2,             #хеш всех карт с их очками
              :'3+' => 3,
              :'4+' => 4,
              :'6+' => 6,
              :'7+' => 7,
              :'8+' => 8,
              :'5+' => 5,
              :'9+' => 9,
              :'10+' => 10,
              :'J+' => 10,
              :'Q+' => 10,
              :'K+' => 10,
              :'A+' => 11,

              :'2<3' => 2,
              :'3<3' => 3,
              :'4<3' => 4,
              :'5<3' => 5,
              :'6<3' => 6,
              :'7<3' => 7,
              :'8<3' => 8,
              :'9<3' => 9,
              :'10<3' => 10,
              :'J<3' => 10,
              :'Q<3' => 10,
              :'K<3' => 10,
              :'A<3' => 11,

              :'2^' => 2,
              :'3^' => 3,
              :'4^' => 4,
              :'5^' => 5,
              :'6^' => 6,
              :'7^' => 7,
              :'8^' => 8,
              :'9^' => 9,
              :'10^' => 10,
              :'J^' => 10,
              :'Q^' => 10,
              :'K^' => 10,
              :'A^' => 11,

              :'2<>' => 2,
              :'3<>' => 3,
              :'4<>' => 4,
              :'5<>' => 5,
              :'6<>' => 6,
              :'7<>' => 7,
              :'8<>' => 8,
              :'9<>' => 9,
              :'10<>' => 10,
              :'J<>' => 10,
              :'Q<>' => 10,
              :'K<>' => 10,
              :'A<>' => 11
 }
  end

  def score(gamer)                    #подсчет очков
    gamer.point = 0
    if gamer.cards.include?(:"A<>")  || gamer.cards.include?(:"A^")  || gamer.cards.include?(:"A<3") || gamer.cards.include?(:"A+")
      score_ace(gamer)
    else
      score_common(gamer)
    end
  end

  def get_name(gamer)                 #ввод имени
    puts "What is you name?"
    gamer.get_name
  end

  def output_card(gamer)              #вывод карт на экран
    puts gamer.cards.keys
  end

  def output_score(gamer)             #вывод очков на экран
    puts gamer.point
  end

  def get_card(gamer)                 #получение игроком карт
    gamer.getting_card(@cards)
    delete_card(gamer.cards.keys[-1])
  end

  def start_game(gamer)                     #раздача карт игроку
    get_card(gamer)
    get_card(gamer)
  end

  def gamer_choice(gamer, choice)             #ход игрока
    case choice
    when 1
      puts "Pass"
    when 2
      get_card(gamer)
      puts "Your cards"
      output_card(gamer)
    end
  end

  def gamer_move_annotation
    puts "You move!"
    puts "What are we doing?"
    puts "1 - Skip move"
    puts "2 - Add card"
    puts "3 - Open cards"
  end

  def dealer_move(dealer)                    #ход дилера
    puts "Dealer move"
    if dealer.point < 17
      puts "Dealer draws card"
      get_card(dealer)
      puts "Cards dealer ** ** **"
    else
      puts "Dealer pass"
    end
  end

  def win(gamer, dealer)
    score(gamer)
    score(dealer)
    all_out(gamer, dealer)

    return puts "Dealer won!" if gamer.point > 21
    return puts "#{gamer.name} won!" if dealer.point > 21

    if gamer.point > dealer.point
      puts "#{gamer.name} won!"
    elsif gamer.point < dealer.point
      puts "Dealer won!"
    else
      puts "Draw!"
    end
  end

  private

  def all_out(gamer, dealer)        #вывод всех карт и очков

    puts "Open all cards"
    puts "Your cards"
    output_card(gamer)
    puts "Your points"
    output_score(gamer)

    puts "Dealer cards"
    output_card(dealer)
    puts "Dealer points"
    output_score(dealer)

  end

  def delete_card(card)               #удаление карты
    @cards.delete(card)
  end

  def score_ace(gamer)
    score_common(gamer)
    if gamer.point > 21
      gamer.point -= 10
    end
  end

  def score_common(gamer)
     gamer.cards.each { |key, value| gamer.point += value }
  end

end
