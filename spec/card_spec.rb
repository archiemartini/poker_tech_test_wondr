require 'card'

RSpec.describe 'the Card class:' do

  before do
    example_card = { 'suit': 'heart', 'value': 5 }
    @card = Card.new(example_card)
  end

  it "holds its initial data in attribute" do
    expect(@card.data).to include(:suit => 'heart', :value => 5)
  end

  it "holds a suit string in attribute" do
    expect(@card.suit).to eq('heart')
  end

  it "holds a value integer in attribute" do
    expect(@card.value).to eq(5)
  end

end