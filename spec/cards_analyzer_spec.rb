require 'cards_analyzer'

RSpec.describe 'the CardsAnalyzer class:' do

  subject(:analyzer) { CardsAnalyzer.new }

  before do
    @example_card_data = {
      flush: [
        double(:mock_card, value: 3, suit: "spade"),
        double(:mock_card, value: 8, suit: "spade"),
        double(:mock_card, value: 2, suit: "spade"),
        double(:mock_card, value: 6, suit: "spade"),
        double(:mock_card, value: 11, suit: "spade"),  
      ],
      three_of_a_kind: [
        double(:mock_card, value: 3, suit: "spade"),
        double(:mock_card, value: 3, suit: "heart"),
        double(:mock_card, value: 3, suit: "club"),
        double(:mock_card, value: 6, suit: "diamond"),
        double(:mock_card, value: 11, suit: "spade"),  
      ],
      straight: [
        double(:mock_card, value: 1, suit: "spade"),
        double(:mock_card, value: 2, suit: "heart"),
        double(:mock_card, value: 3, suit: "club"),
        double(:mock_card, value: 4, suit: "diamond"),
        double(:mock_card, value: 5, suit: "spade"),  
      ],
      pair: [
        double(:mock_card, value: 2, suit: "spade"),
        double(:mock_card, value: 2, suit: "heart"),
        double(:mock_card, value: 6, suit: "club"),
        double(:mock_card, value: 4, suit: "diamond"),
        double(:mock_card, value: 11, suit: "spade"),  
      ]
    }
  end

  describe 'the analyze_cards method' do

    describe 'the integration of private function three_of_a_kind?' do

      it "conditional returns the appropriate hash when true" do
        set = @example_card_data[:three_of_a_kind]
        expect(analyzer.analyze_cards(set)).to include(:rank => 'Three of a Kind', :strength => 4, :value => 3)
      end
    end

    describe 'the integration of private function flush?' do

      it "conditional returns the appropriate hash when true" do
        flush = @example_card_data[:flush] 
        expect(analyzer.analyze_cards(flush)).to include(:rank => 'Flush', :strength => 6, :value => 11)
      end

    end
    
    describe 'the integration of private function straight?' do

      it "conditional returns the appropriate hash when true" do
        straight = @example_card_data[:straight] 
        expect(analyzer.analyze_cards(straight)).to include(:rank => 'Straight', :strength => 5, :value => 5)
      end

    end
  
    describe 'the integration of private function pair?' do

      it "conditional returns the appropriate hash when true" do
        pair = @example_card_data[:pair] 
        expect(analyzer.analyze_cards(pair)).to include(:rank => 'Pair', :strength => 2, :value => 2)
      end

    end

  end

end