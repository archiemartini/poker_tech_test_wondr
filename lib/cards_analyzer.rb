# frozen_string_literal: true

# Analyses array of card objects passed down by Hand objects 'generate_analysis' method
class CardsAnalyzer
  def initialize(hand_data:)
    @data = hand_data
    @children = [
      FlushAnalyzer.new(hand_data: hand_data),
      ThreeOfAKindAnalyzer.new(hand_data: hand_data),
      PairAnalyzer.new(hand_data: hand_data),
      StraightAnalyzer.new(hand_data: hand_data)
    ]
  end

  def analyze_cards(cards_object_array)
    cards = cards_object_array
    @children.each do |analyzer|
      return analyzer.analyze_cards(cards) if analyzer.analyze_cards(cards) != false
    end
  end
end

class FlushAnalyzer < CardsAnalyzer
  def initialize(hand_data:)
    super(hand_data: hand_data)
  end

  def analyze_cards(cards_object_array)
    cards = cards_object_array
    suits = cards.map(&:suit)
    sorted_values = cards.map(&:value).sort
    suits.uniq.length == 1 ? Flush.new(hand_data: @data, analyzer: nil, value: sorted_values.last) : false
  end
end

class StraightAnalyzer < CardsAnalyzer
  def initialize(hand_data:)
    super(hand_data: hand_data)
  end

  def analyze_cards(cards_object_array)
    cards = cards_object_array
    sorted_values = cards.map(&:value).sort
    straight_boolean = sorted_values.each_cons(2).all? { |x, y| y == x + 1 }
    straight_boolean ? Straight.new(hand_data: @data, analyzer: nil, value: sorted_values.last) : false
  end
end

class ThreeOfAKindAnalyzer < CardsAnalyzer
  def initialize(hand_data:)
    super(hand_data: hand_data)
  end

  def analyze_cards(cards_object_array)
    cards = cards_object_array
    sorted_values = cards.map(&:value).sort
    sorted_values.each do |value|
      return ThreeOfAKind.new(hand_data: @data, analyzer: nil, value: value) if sorted_values.count(value) == 3
    end
    false
  end
end

class PairAnalyzer < CardsAnalyzer
  def initialize(hand_data:)
    super(hand_data: hand_data)
  end

  def analyze_cards(cards_object_array)
    cards = cards_object_array
    values = cards.map(&:value)
    values.each do |value|
      return Pair.new(hand_data: @data, analyzer: nil, value: value) if values.count(value) == 2
    end
    false
  end
end
