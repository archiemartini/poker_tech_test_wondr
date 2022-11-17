# frozen_string_literal: true

class PokerHandRanker
  attr_accessor :data, :hands, :ranked_hands

  def initialize(json_data:)
    @data = json_data
    @hands = []
    @ranked_hands = []
  end

  def generate_hands
    return unless @hands.empty?

    @data.map do |hand_data|
      hands.push(Hand.new(hand_data: hand_data))
    end
  end

  def set_ranked_hands
    return unless @hands

    @ranked_hands = @hands.map(&:generate_analysis)
  end

  def sort_ranked_hands_in_order
    @ranked_hands.sort! do |x, y|
      y[:strength] == x[:strength] ? y[:value] <=> x[:value] : y[:strength] <=> x[:strength]
    end
  end

  def extract_original_data
    @ranked_hands = @ranked_hands.map do |hand|
      hand[:original_data]
    end
  end
end
