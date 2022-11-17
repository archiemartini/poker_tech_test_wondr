# frozen_string_literal: true

require 'hand'

RSpec.describe 'the Hand class' do
  example_hand = [
    { "suit": 'heart', "value": 5 },
    { "suit": 'heart', "value": 8 },
    { "suit": 'spade', "value": 1 },
    { "suit": 'club', "value": 5 },
    { "suit": 'diamond', "value": 5 }
  ]
  let(:mock_analyzer) do
    double(:mock_analyzer, analyze_cards: { "rank": 'Three of a Kind', 'strength': 4, "value": 5 })
  end
  subject(:hand) { Hand.new(hand_data: example_hand, cards_analyzer: mock_analyzer) }

  it 'holds the original data in initialization attribute' do
    expect(hand.data).to eq example_hand
  end

  describe 'the generate_analysis method' do

    before do
      hand.generate_analysis
    end
    it 'changes attribute to correct rank information' do
      expect(hand.rank).to eq 'Three of a Kind'
    end
    
    it 'changes attribute to correct strength information' do
      expect(hand.strength).to eq 4
    end

    it 'changes attribute to correct rank information' do
      expect(hand.value).to eq 5
    end

  end

  describe "the generate_cards private method's integration with generate_analysis method" do
    before do
      hand.generate_analysis
    end

    it 'populates the @cards attribute array with card objects' do
      expect(hand.cards.length).to eq 5
    end

    it 'populates the @cards attribute array with 5 Card objects' do
      expect(hand.cards).to include(a_kind_of(Object))
    end

    it 'does not populate if array is already populated' do
      hand.generate_analysis
      expect(hand.cards.length).to eq 5
    end
  end
end
