require 'cards_analyzer'

RSpec.describe 'the CardsAnalyzer class:' do

  subject(:analyzer) { CardsAnalyzer.new }

  describe 'the analyze_cards method' do

    describe 'the integration of private function three_of_a_kind?' do

      it "returns the appropriate hash when true" do
        example_cards_set = [
          double(:mock_card, value: 3, suit: "spade"),
          double(:mock_card, value: 3, suit: "heart"),
          double(:mock_card, value: 3, suit: "club"),
          double(:mock_card, value: 6, suit: "diamond"),
          double(:mock_card, value: 11, suit: "spade"),  
        ]
        expect(analyzer.analyze_cards(example_cards_set)).to include(:rank => 'Three of a Kind', :strength => 4, :value => 3)
      end
    end

  end

end