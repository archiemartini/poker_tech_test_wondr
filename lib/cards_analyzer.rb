class CardsAnalyzer
  
  def analyze_cards(cards_object_array)
    if flush?(cards_object_array) != false
      flush?(cards_object_array)
    elsif three_of_a_kind?(cards_object_array) != false
      three_of_a_kind?(cards_object_array)
    end
  end 

  private

  def flush?(hand)
    sorted_values = hand.map { |card|
      card.value
    }.sort
    suits = hand.map { |card|
      card.suit
    }
    return suits.uniq.length == 1 ? {"rank": "Flush", "value": sorted_values.last, "strength": 6} : false
  end


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