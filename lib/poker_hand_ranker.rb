class PokerHandRanker

  attr_accessor :data, :hands

  def initialize(json_data)
    @data = json_data
    @hands = []
  end
end