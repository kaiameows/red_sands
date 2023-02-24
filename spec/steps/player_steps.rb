# frozen_string_literal: true

module PlayerSteps
  step 'a player is created' do
    @player = build(:player)
  end

  step 'the player :might_have :field' do |might_have, field|
    expectation = might_have ? :not_to : :to
    expect(@player.send(field)).send(expectation, be_nil)
  end

  step 'the player :might_have a :field of :count' do |might_have, field, count|
    expectation = might_have ? :not_to : :to
    expect(@player.send(field).count).send(expectation, eq(count.to_i))
  end

  step 'the player :whether_to have a :field of :count' do |whether_to, field, count|
    expectation = whether_to ? :to : :not_to
    expect(@player.send(field)).send(expectation, eq(count))
  end

  step 'the player :whether_to have an empty hand' do |whether_to|
    expectation = whether_to ? :to : :not_to
    expect(@player.hand).send(expectation, be_empty)
  end

  step 'the player :might_have starter deck of :count cards' do |might_have, count|
    expectation = might_have ? :to : :not_to
    expect(@player.deck.size).send(expectation, eq(count))
  end
end
