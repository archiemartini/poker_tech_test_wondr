require 'hand'

RSpec.describe "the Hand class" do

  before do
    @example_hand = [
      {"suit": "heart", "value": 5},
      {"suit": "heart", "value": 8},
      {"suit": "spade", "value": 1},
      {"suit": "club", "value": 5},
      {"suit": "diamond", "value": 5}
    ]
    @hand = Hand.new(@example_hand)
  end

  it "holds the original data in initialization attribute" do
    expect(@hand.data).to eq @example_hand
  end

  describe "the generate_cards method" do

    before do
      @hand.generate_cards()
    end

    it "populates the @cards attribute array with card objects" do
      expect(@hand.cards.length).to eq 5   
    end

    it "populates the @cards attribute array with 5 Card objects" do
      expect(@hand.cards).to include(a_kind_of(Object)) 
    end
    
    it "does not populate if array is already populated" do
      @hand.generate_cards()
      expect(@hand.cards.length).to eq 5
    end
  end

end