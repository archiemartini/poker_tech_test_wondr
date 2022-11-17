require 'card'

RSpec.describe 'the Card class:' do

  before do
    example_card = { 'suit': 'heart', 'value': 5 }
    @card = Card.new(example_card)
  end

end