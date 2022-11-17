# frozen_string_literal: true

require 'poker_hand_ranker'

RSpec.describe 'the PokerHandRanker class:' do
  example_json_data = [
    [
      { "suit": 'heart', "value": 5 },
      { "suit": 'heart', "value": 8 },
      { "suit": 'spade', "value": 1 },
      { "suit": 'club', "value": 5 },
      { "suit": 'diamond', "value": 5 }
    ],
    [
      { "suit": 'club', "value": 1 },
      { "suit": 'club', "value": 3 },
      { "suit": 'club', "value": 8 },
      { "suit": 'club', "value": 9 },
      { "suit": 'club', "value": 11 }
    ]
  ]
  subject(:ranker) { PokerHandRanker.new(json_data: example_json_data) }

  it 'has an empty @hands array when it is inititalized' do
    expect(ranker.hands).to eq []
  end

  describe 'the generate_hands method' do
    it 'populates the @hands attribute array after being called' do
      ranker.generate_hands
      expect(ranker.hands).to include(a_kind_of(Object))
    end

    it 'populates the @hands attribute array with 2 objects' do
      ranker.generate_hands
      expect(ranker.hands.length).to eq 2
    end
  end

  describe 'the sort_ranked_hands_in_order' do
    let(:mock_pair_object) { double(:mock_pair_object, rank: 'Pair', strength: 2, value: 2) }
    let(:mock_flush_object) { double(:mock_flush_object, rank: 'Flush', strength: 6, value: 11) }
    let(:mock_set_object1) { double(:mock_set_object1, rank: 'Three of a Kind', strength: 4, value: 2) }
    let(:mock_set_object2) { double(:mock_set_object2, rank: 'Three of a Kind', strength: 4, value: 5) }

    before do
      ranker.ranked_hands = [
        mock_pair_object,
        mock_flush_object,
        mock_set_object1,
        mock_set_object2
      ]

      @expected = [
        mock_flush_object,
        mock_set_object2,
        mock_set_object1,
        mock_pair_object
      ]
    end

    it 'correctly orders example data' do
      expect(ranker.sort_ranked_hands_in_order).to eq @expected
    end
  end

  describe 'the set_ranked_hands method' do
    let(:mock_analyzed_hand) { double(:mock_analyzed_hand, rank: 'Flush') }

    it 'the hand object from @hands returns a analyzed hand into the @ranked_hands array when generate_analysis is called upon it' do
      ranker.hands = [
        double(:mock_hand_object, generate_analysis: mock_analyzed_hand)
      ]
      ranker.set_ranked_hands
      expect(ranker.ranked_hands).to include mock_analyzed_hand
    end
  end

  describe 'the extract_original_data method' do
    before do
      @expected = [
        [
          { 'suit' => 'club', 'value' => 1 },
          { 'suit' => 'club', 'value' => 3 },
          { 'suit' => 'club', 'value' => 8 },
          { 'suit' => 'club', 'value' => 9 },
          { 'suit' => 'club', 'value' => 11 }
        ]
      ]
      ranker.ranked_hands = [
        double(:mock_hand_object, data: @expected[0])
      ]
    end
    it 'extracts the original data from anlysis object correctly' do
      ranker.extract_original_data
      expect(ranker.ranked_hands).to eq @expected
    end
  end
end
