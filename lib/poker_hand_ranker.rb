class PokerHandRanker

  attr_accessor :data, :hands

  def initialize(json_data)
    @data = json_data
    @hands = []
  end

  def generate_hands
    return unless @hands.empty?
    
    @data.map { |hand_data|
      hands.push(Hand.new(hand_data: hand_data))
    }
  end
end