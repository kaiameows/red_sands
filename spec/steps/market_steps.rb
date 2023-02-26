# typed: false
# frozen_string_literal: true

module MarketSteps
  step 'a market is created' do
    @market = build(:market)
  end

  step 'the market should have 5 buyable cards' do
    expect(@market.buyable_cards.size).to eq(5)
  end

  step 'the market :can_has a :deck_type deck' do |can_has, deck_type|
    expectation = can_has ? :not_to : :to
    expect(@market.decks[deck_type]).send(expectation, be_nil)
  end

  step 'the market :can_has a :deck_type deck of :count cards' do |can_has, deck_type, count|
    expectation = can_has ? :not_to : :to
    expect(@market.decks[deck_type].count).send(expectation, eq(count.to_i))
  end

  step 'the market :whether_to have a :deck_type deck of :count cards' do |whether_to, deck_type, count|
    expectation = whether_to ? :to : :not_to
    expect(@market.decks[deck_type]).send(expectation, eq(count))
  end

  step 'the market :whether_to have an empty :deck_type deck' do |whether_to, deck_type|
    expectation = whether_to ? :to : :not_to
    expect(@market.decks[deck_type]).send(expectation, be_empty)
  end
end
