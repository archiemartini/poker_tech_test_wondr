require './lib/card'
require './lib/hand'
require './lib/cards_analyzer'
require './lib/poker_hand_ranker'
require 'json'

json_from_file = File.read("./hands.json")
hands_data = JSON.parse(json_from_file)

ranker = PokerHandRanker.new(json_data: hands_data)
ranker.generate_hands
p ranker.hands

