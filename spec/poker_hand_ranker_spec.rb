require 'poker_hand_ranker'

RSpec.describe 'the PokerHandRanker class:' do

  before do
    example_json_data = [
      [
        {"suit": "heart", "value": 5},
        {"suit": "heart", "value": 8},
        {"suit": "spade", "value": 1},
        {"suit": "club", "value": 5},
        {"suit": "diamond", "value": 5}
      ],
      [
        {"suit": "club", "value": 1},
        {"suit": "club", "value": 3},
        {"suit": "club", "value": 8},
        {"suit": "club", "value": 9},
        {"suit": "club", "value": 11}
      ]
    ]
  @ranker = PokerHandRanker.new(example_json_data)
  end
  it "has an empty @hands array when it is inititalized" do
    expect(@ranker.hands).to eq []
  end

  describe 'the generate_hands method' do
    it "populates the @hands attribute array after being called" do
      expect(@ranker.generate_hands).to include(a_kind_of(Object))
    end
  end

end