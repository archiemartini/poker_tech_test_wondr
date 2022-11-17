# frozen_string_literal: true

require './lib/card'
require './lib/hand'
require './lib/cards_analyzer'
require './lib/poker_hand_ranker'
require 'json'

json_from_file = File.read('./hands.json')
hands_data = JSON.parse(json_from_file)

ranker = PokerHandRanker.new(json_data: hands_data)
ranker.generate_hands

puts 'INITIAL HANDS:', ' '
ranker.hands.map { |hand| puts hand.inspect, ' '}

ranker.set_ranked_hands

puts 'UNSORTED HANDS', ' '
ranker.ranked_hands.map { |hand| puts hand.inspect, ' '}

ranker.sort_ranked_hands_in_order

puts 'SORTED HANDS', ' '
ranker.ranked_hands.map { |hand| puts hand, ' '}

ranker.extract_original_data

puts 'REORDERED ORIGINAL DATA'
ranker.ranked_hands.map{ |hand| puts hand, ' '}

new_json_data = ranker.ranked_hands
options = {
  array_nl: "\n ",
  indent: " "
}
File.write('./hands.json', JSON.generate(new_json_data, options))
