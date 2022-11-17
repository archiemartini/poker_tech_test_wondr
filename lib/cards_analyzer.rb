class CardsAnalyzer
  
  def analyze_cards(cards_object_array)
    if three_of_a_kind?(cards_object_array) != false
      three_of_a_kind?(cards_object_array)
    end
  end 

  private


  def three_of_a_kind?(card_object_array)
    sorted_values = card_object_array.map { |card|
      card.value
    }.sort
    sorted_values.each do |value|
        return {'rank': 'Three of a Kind', 'value': value, 'strength': 4} if sorted_values.count(value) == 3
    end
    false
  end
end