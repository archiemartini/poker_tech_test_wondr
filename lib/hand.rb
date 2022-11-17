# frozen_string_literal: true

class Hand
  attr_accessor :data, :cards, :strength, :rank,  :value

  def initialize(hand_data:, cards_analyzer: nil)
    @data = hand_data
    @analyzer = cards_analyzer || CardsAnalyzer.new
    @cards = []
    @rank = nil
    @strength = nil
    @value = nil

  end

  def generate_analysis
    generate_cards
    analysis = @analyzer.analyze_cards(@cards)
    @rank = analysis[:rank]
    @strength = analysis[:strength]
    @value = analysis[:value]
    self
  end

  private

  def add_original_data
    @analysis[:original_data] = @cards.map(&:data)
  end

  def generate_cards
    return unless @cards.empty?

    @data.each do |card_data|
      @cards.push(Card.new(card_data_hash: card_data))
    end
  end
end
