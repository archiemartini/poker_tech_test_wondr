require 'poker_hand_ranker'

RSpec.describe 'the PokerHandRanker class:' do

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
  subject(:ranker) { PokerHandRanker.new(json_data: example_json_data) }

  it "has an empty @hands array when it is inititalized" do
    expect(ranker.hands).to eq []
  end

  describe 'the generate_hands method' do
    it "populates the @hands attribute array after being called" do
      ranker.generate_hands
      expect(ranker.hands).to include(a_kind_of(Object))
    end

    it "populates the @hands attribute array with 2 objects" do
      ranker.generate_hands
      expect(ranker.hands.length).to eq 2
    end
  end

  describe 'the sort_ranked_hands_in_order' do

    before do
      ranker.ranked_hands = [
        {:rank=>"Pair", :value=>2, :strength=>2},
        {:rank=>"Three of a Kind", :value=>5, :strength=>4},
        {:rank=>"Flush", :value=>11, :strength=>6},
        {:rank=>"Three of a Kind", :value=>2, :strength=>4},
        {:rank=>"Straight", :value=>5, :strength=>5},
      ]

      @expected = [
        {:rank=>"Flush", :value=>11, :strength=>6},
        {:rank=>"Straight", :value=>5, :strength=>5},
        {:rank=>"Three of a Kind", :value=>5, :strength=>4},
        {:rank=>"Three of a Kind", :value=>2, :strength=>4},
        {:rank=>"Pair", :value=>2, :strength=>2}
      ]
    end

    it "correctly orders example data" do      
      expect(ranker.sort_ranked_hands_in_order).to eq @expected
    end
  end

end