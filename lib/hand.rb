class Hand

  attr_accessor :data, :cards

  def initialize(hand_data:)
    @data = hand_data
    @cards = []
  end

  def generate_cards
    if @cards.empty?
      @data.each { |card_data|
        @cards.push(Card.new(card_data))
      }
    end
  end
end