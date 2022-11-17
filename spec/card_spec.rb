require 'card'

RSpec.describe 'the Card class:' do
  example_card = { 'suit' => 'heart', 'value' => 5 }
  subject(:card) { Card.new(card_data_hash: example_card) }

  it 'holds the original data within attribute' do
    expect(card.data).to include('suit' => 'heart', 'value' => 5)
  end

  it 'holds a suit attribute' do
    expect(card.suit).to eq 'heart'
  end

  it 'holds a value attribute' do
    expect(card.value).to eq 5
  end
end
