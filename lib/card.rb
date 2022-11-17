# frozen_string_literal: true

# Creates a Card object from the card_data passed down by Hand object's generate_cards method
class Card
  attr_accessor :suit, :value, :data

  def initialize(card_data_hash:)
    @data = card_data_hash
    @suit = card_data_hash['suit']
    @value = card_data_hash['value']
  end
end
