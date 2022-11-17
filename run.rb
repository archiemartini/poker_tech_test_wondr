require './lib/card'
require './lib/hand'
require './lib/cards_analyzer'
require './lib/poker_hand_ranker'
require 'json'

json_from_file = File.read("./hands.json")
hands_data = JSON.parse(json_from_file)

ranker = PokerHandRanker.new(json_data: hands_data)
ranker.generate_hands


ranker.set_ranked_hands
puts "UNSORTED HANDS", ranker.ranked_hands, " "

ranker.sort_ranked_hands_in_order

puts "SORTED HANDS",ranker.ranked_hands, " "

