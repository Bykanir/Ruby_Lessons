# + крести clubs
# <3  червы hearts
# ^  пики spades
# <> бубны diamonds

class Deck

  attr_accessor :deck
  attr_reader :points

  def initialize
    @deck= %w[2+ 2<> 2^ 2<3
              3+ 3<> 3^ 3<3
              4+ 4<> 4^ 4<3
              5+ 5<> 5^ 5<3
              6+ 6<> 6^ 6<3
              7+ 7<> 7^ 7<3
              8+ 8<> 8^ 8<3
              9+ 9<> 9^ 9<3
              10+ 10<> 10^ 10<3
              J+ J<> J^ J<3
              Q+ Q<> Q^ Q<3
              K+ K<> K^ K<3
              A+ A<> A^ A<3]
  end

  def determination_points(card)    # определение сколько очков у карты
    @points = (2..10).to_a
    case card
    when "2+", "2<>", "2^", "2<3"
    points[0]
    when "3+", "3<>", "3^", "3<3"
    points[1]
    when "4+", "4<>", "4^", "4<3"
    points[2]
    when "5+", "5<>", "5^", "5<3"
    points[3]
    when "6+", "6<>", "6^", "6<3"
    points[4]
    when "7+", "7<>", "7^", "7<3"
    points[5]
    when "8+", "8<>", "8^", "8<3"
    points[6]
    when "9+", "9<>", "9^", "9<3"
    points[7]
    when "10+", "10<>", "10^", "10<3",
          "J+", "J<>", "J^", "J<3",
          "Q+", "Q<>", "Q^", "Q<3",
          "K+", "K<>", "K^", "K<3",
          "A+", "A<>", "A^", "A<3"
    points[8]
    end
  end

  def get_card(player)
    card = @deck.sample
    player.cards << card
    player.points += determination_points(card)
    delete_card(card)
  end

  private

  def delete_card(card)               #удаление карты
    @deck.delete(card)
  end

end
