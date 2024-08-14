# Poker Tech Test

Poker tech test for Wondr medical. Was glad to see this as I am a consummate, degenerate, gambler. Also what on earth is a [Five of a Kind? ](https://en.wikipedia.org/wiki/List_of_poker_hands
)

## Installation

`bundle install` to install dependencies

## Usage

Whilst in the root of the project
```ruby
ruby run.rb
```

Have the `hands.json` open to see the programme do its magic!
The ranked JSON data will be printed in a similar form to the original in the terminal.

## Planning:

UML diagram for class interaction:
https://miro.com/app/board/uXjVPDHJ3wo=/
![diagram](./UML-diagram.png)

I initially discerned 4 classes that would comprise a programme that would solve this challenge. 4 child classes of Hand then followed.

## Structure

### `run.rb`
- All the expected user interaction is held in `run.rb`
- I featured every method to show the sequence in which the programme works and its various outputs
- Comment out the final line of `run.rb` to disable writing into the JSON file
```ruby
File.write('./hands.json', JSON.generate(new_json_data, options))
```
### `class PokerHandRanker`
- `generate_cards` evokes an array of Hand Objects into the `@hands` array
- `set_ranked_hands` maps through the `@data` array and calls the Hand Object's 'generate_analysis` method
- `sort_ranked_hands_in_order` calls a sorting algorithm on the `@ranked-hands` array. I added a pair to the original JSON data as proof of the sorting algorithm sorting lower ranked hands below the two three of a kinds. Seriously, tho, check that sort algorithm.
- `extract_original_data` maps through the `@ranked_hands` Object array and accesses the `@data` attribute within them. Returning the data back into the JSON format.

### `class Hand`
- `generate_analysis` returns reproduced version of the Hand object, under the appropriate child class
- `generate_hands` is called privately by the `get_analysis` method, to populate the `@cards` attribute

### `ChildClasses < Hand`
- I was originally returning hashes (example `{:rank=>"Three of a Kind", :value=>5, :strength=>4}`) containing the analysis information, however, this brought up some issues and required extra methods to insert `original_data` into these hashes.
- Using the principle of inheritence I was able to cut down my lines and increase my readability.
- `@rank` attribute is the given name of the Poker hand
- `@strength` attribute is the strength of a hand where a Royal Flush is `10`, and a High card is `1`, e.g. a Three of a Kind is `4`
- `@value` attribute is the decider in the case of such occurances when it is Three of a Kind vs Three of a Kind, SEE sorting algorithm.

### `class CardsAnalyzer`
- `analyze_cards(cards_object)` calls all the private hand identifying functions with an array of Card Objects in sequence of strength descending inside an id/elsif statement.
- I had already attempted [this Poker kata](https://www.codewars.com/kata/5739174624fc28e188000465) having talked to Frank about this very tech test at the careers fair.
- I was able to recycle the hand identifying methods which cut down on time.
- Not happy about that if/elsif statement but it'll do. Couldn't think of how a cleaner switch/case statement could apply in this context

### `class Card`
- does what it says on the tin
- arguably not necessary, but I feel better about creating objects of them, and accessing those objects is more readable within the CardsAnalyzer class, also allows for `values = cards.map(&:value)`, etc

## Roadmap / Future Implementations / Wants and Desires / Considerations / Dream Board
- The app, isn't anywhere near to a complete PokerRanking application
  - **Hands Not Included:** would need to be implemented. I have the logic to hand but I didn't want to go too beyond the brief and be a sweat
  - **High Cards, Straights and Flushes:** would require a far different value rating if comparisons got more specific. I'd envisage a sorted Array of the    entire hand's values would have to feature in the object's attributes on the off chance that the comparison of said ranks would happen to match multiple    consecutive values). Say, two hands had King High, then the next highest value would be evaluated, if they matched, then the next, and so on... (flushes    and straights default to the same high card evaluation if matching surface values. Straight Flushes too? No matter how against the odds, hopefully a        single value would solve it.
  - **Ace 1==14 duality** ultimately the programme only accounts for the Ace equalling 1, as the brief stated. However to devleop it further to also rank as the High card generally, and in Straights, etc, I've seen clever methods that evaluate "value distribution" within the hand, these methods will create an array of `1`s and `0`s marking the distribution of a certain value, this sort of method will place a `1` at both `distribution[0]` and `distribution[13]` respectively
- **Final JSON formatting** I was going for style points with that final `File.write` but I COULD NOT for the life of me get that exact formatting, indent was messing me up, got it close as though
- **`attr_accessor` prevalence** It's my assumption that flagrant use of `attr_accessor`s in real life applications would leave the programme open to manipulation
- **Mocking and Stubbing** Again, I really need to work on my mocking and stubbing skills in RSpec. I've been coding in predominately JavaScript/Node.js for the longest time.
- **Linting** The only thing rubocop was raising issue with at the end was some of the block sizes featured in my test. Again down to sloppy mocking on my part.


