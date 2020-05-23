class Player

    attr_reader :cards
    attr_accessor :points

  def initialize
    @cards = []
    @points = 0
  end

  def score                   # подсчет очков
    if self.cards.any? do |card|
      card == 'A+' || card == 'A<>' || card == 'A^' || card == 'A<3'
    end
      score_ace(self)
    else
      self.points
    end
  end

  protected

  def score_ace(player)
    if player.points > 21
      player.points -= 10
    end
  end
end
