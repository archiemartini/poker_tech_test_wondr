# Poker Tech Test

## Initial planning:

### Identifiable classes:
- PokerHandRanker
- Hand
- Card
- CardsAnalyzer

#### class PokerHandRanker
- def initialize(json_data)
- def generate_hands()
- def rank_data()
- def get_rank_info()

#### class Hand
- def initialize(hand_data)
- def get_ranking()
- def stringify_data()

#### class Card
- def initialize(card_data)
- attr_accessor :suit, :value

#### class CardsAnalyzer
- def initialize(cards_object_array)
- def analyze_hand()
- private:
- three_of_kind?
- flush?
- straight? 