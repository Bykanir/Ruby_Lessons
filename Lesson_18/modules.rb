module GetCard

  def getting_card(cards)
    card = cards.keys.sample
    @cards << cards[card]
  end

end
