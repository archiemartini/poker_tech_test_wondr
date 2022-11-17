class Hand

  attr_accessor :data, :cards

  def initialize(hand_data:, cards_analyzer: nil)
    @data = hand_data
    @analyzer = cards_analyzer || CardsAnalyzer.new
    @cards = []
    @analysis = nil
  end

  def generate_analysis
    generate_cards
    @analysis = @analyzer.analyze_cards(@cards)
    @analysis
  end

  private

  def generate_cards
    return unless @cards.empty?

    @data.each do |card_data|
      @cards.push(Card.new(card_data_hash: card_data))
    end
  end
end