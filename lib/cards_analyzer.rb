# frozen_string_literal: true

class CardsAnalyzer
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
    suits.uniq.length == 1 ? { "rank": 'Flush', "value": sorted_values.last, "strength": 6 } : false
  end

  def three_of_a_kind?(cards)
    sorted_values = cards.map(&:value).sort
    sorted_values.each do |value|
      return { 'rank': 'Three of a Kind', 'value': value, 'strength': 4 } if sorted_values.count(value) == 3
    end
    false
  end

  def straight?(cards)
    sorted_values = cards.map(&:value).sort
    straight_boolean = sorted_values.each_cons(2).all? { |x, y| y == x + 1 }
    straight_boolean ? { 'rank': 'Straight', 'value': sorted_values.last, 'strength': 5 } : false
  end

  def pair?(cards)
    values = cards.map(&:value)
    values.each do |value|
      return { 'rank': 'Pair', 'value': value, 'strength': 2 } if values.count(value) == 2
    end
    false
  end
end
