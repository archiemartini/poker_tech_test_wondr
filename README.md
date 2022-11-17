# Poker Tech Test

## Initial planning:

### Identifiable classes:
- HandRanker
- Hand
- Card
- HandAnalyzer

#### class HandRanker
- def initialize(jsonData)
- def generate_hands()
- def rank_data()
- def get_rank_info()

#### class Hand
- def initialize(handData)
- def get_ranking()
- def stringify_data()

#### class Card
- def initialize(cardData)
- attr_accessor :suit, :value

#### class HandAnalyzer
- def initialize(handObject)
- def analyze_hand()
- private:
- three_of_kind?
- flush?
- straight? 