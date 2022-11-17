# frozen_string_literal: true

class Hand
  attr_accessor :data, :cards, :strength, :rank,  :value

  def initialize(hand_data:, analyzer: nil)
    @data = hand_data
    @analyzer = analyzer || CardsAnalyzer.new(hand_data: hand_data)
    @cards = []
  end

  def generate_analysis
    generate_cards
    analysis = @analyzer.analyze_cards(@cards)
    self
  end

  private

  def generate_cards
    return unless @cards.empty?

    @data.each do |card_data|
      @cards.push(Card.new(card_data_hash: card_data))
    end
  end
end

class Flush < Hand
  attr_accessor :rank, :strength, :value

  def initialize(hand_data:, analyzer:, value:)
    super(hand_data: hand_data, analyzer: analyzer)
    @rank = 'Flush'
    @strength = 6
    @value = value
  end
end

class Straight < Hand
  attr_accessor :rank, :strength, :value

  def initialize(hand_data:, analyzer:, value:)
    super(hand_data: hand_data, analyzer: analyzer)
    @rank = 'Straight'
    @strength = 5
    @value = value
  end
end

class ThreeOfAKind < Hand
  attr_accessor :rank, :strength, :value

  def initialize(hand_data:, analyzer:, value:)
    super(hand_data: hand_data, analyzer: analyzer)
    @rank = 'Three of a Kind'
    @strength = 4
    @value = value
  end
end

class Pair < Hand
  attr_accessor :rank, :strength, :value

  def initialize(hand_data:, analyzer:, value:)
    super(hand_data: hand_data, analyzer: analyzer)
    @rank = 'Pair'
    @strength = 2
    @value = value
  end
end
