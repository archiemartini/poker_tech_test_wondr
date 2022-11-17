# frozen_string_literal: true

class Card
  attr_accessor :suit, :value, :data

  def initialize(card_data_hash:)
    @data = card_data_hash
    @suit = card_data_hash['suit']
    @value = card_data_hash['value']
  end
end
