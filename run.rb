require './lib/card'
require './lib/hand'
require './lib/hand_analyzer'
require './lib/hand_ranker'
require 'json'

json_from_file = File.read("./hands.json")
hands_data = JSON.parse(json_from_file)

ranker = HandRanker.new(json_data: hands_data)
ranker.generate_hands

