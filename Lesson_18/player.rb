class Player

    attr_reader :cards
    attr_accessor :points

  def initialize
    @cards = []
    @points = 0
  end

  def score                   # подсчет очков
    self.points = 0
    self.cards.each do |card|
      if card.include?('A')
        self.points < 11 ? self.points += 11 : self.points += 1
      else
        card.to_i == 0 ? self.points += 10 : self.points += card.to_i
      end
    end
  end
end
