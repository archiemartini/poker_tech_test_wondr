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

  def sort_ranked_hands_in_order
    @ranked_hands.sort! do |x, y|
      y[:strength] <=> x[:strength]
    end
  end

  def set_ranked_hands
    return unless @hands

    @ranked_hands = @hands.map(&:generate_analysis)
  end
end