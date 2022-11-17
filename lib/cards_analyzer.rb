# frozen_string_literal: true

# Analyses array of card objects passed down by Hand objects 'generate_analysis' method
class CardsAnalyzer
  def initialize(hand_data:)
    @data = hand_data
  end

  def analyze_cards(cards_object_array)
    cards = cards_object_array
    if flush?(cards) != false
      flush?(cards)
    elsif straight?(cards) != false
      straight?(cards)
    elsif three_of_a_kind?(cards) != false
      three_of_a_kind?(cards)
    elsif pair?(cards) != false
      pair?(cards)
    end
  end

  private

  def flush?(cards)
    suits = cards.map(&:suit)
    sorted_values = cards.map(&:value).sort
    suits.uniq.length == 1 ? Flush.new(hand_data: @data, analyzer: nil, value: sorted_values.last) : false
  end

  def three_of_a_kind?(cards)
    sorted_values = cards.map(&:value).sort
    sorted_values.each do |value|
      return ThreeOfAKind.new(hand_data: @data, analyzer: nil, value: value) if sorted_values.count(value) == 3
    end
    false
  end

  def straight?(cards)
    sorted_values = cards.map(&:value).sort
    straight_boolean = sorted_values.each_cons(2).all? { |x, y| y == x + 1 }
    straight_boolean ? Straight.new(hand_data: @data, analyzer: nil, value: sorted_values.last) : false
  end

  def pair?(cards)
    values = cards.map(&:value)
    values.each do |value|
      return Pair.new(hand_data: @data, analyzer: nil, value: value) if values.count(value) == 2
    end
    false
  end
end
