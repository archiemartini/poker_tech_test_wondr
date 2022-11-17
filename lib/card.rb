class Card

  attr_accessor :data, :suit, :value

  def initialize(card_data_hash)
    @data = card_data_hash
    @suit = card_data_hash[:suit]
    @value = card_data_hash[:value]
  end

end