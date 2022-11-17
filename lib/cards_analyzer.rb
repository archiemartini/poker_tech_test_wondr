class CardsAnalyzer
  
  def analyze_cards(cards_object_array)
    cards = cards_object_array
    if flush?(cards) != false
      flush?(cards)
    elsif straight?(cards) != false
      straight?(cards)
    elsif three_of_a_kind?(cards) != false
      three_of_a_kind?(cards)
    end
  end 

  private

  def flush?(cards)
    sorted_values = cards.map { |card|
      card.value
    }.sort
    suits = cards.map { |card|
      card.suit
    }
    return suits.uniq.length == 1 ? {"rank": "Flush", "value": sorted_values.last, "strength": 6} : false
  end


  def three_of_a_kind?(cards)
    sorted_values = cards.map { |card|
      card.value
    }.sort
    sorted_values.each do |value|
        return {'rank': 'Three of a Kind', 'value': value, 'strength': 4} if sorted_values.count(value) == 3
    end
    false
  end

  def straight?(cards)
    sorted_values = cards.map { |card|
      card.value
    }.sort
    straight_boolean = sorted_values.each_cons(2).all? { |x,y| y == x + 1 } 
    straight_boolean ? {'rank': 'Straight', 'value': sorted_values.last, 'strength': 5} : false
  end



end