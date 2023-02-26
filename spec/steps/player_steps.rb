# typed: false
# frozen_string_literal: true

module PlayerSteps
  step 'a player is created' do
    @player = build(:player)
  end

  step 'the player :whether_to have a :field' do |whether_to, field|
    expectation = whether_to ? :not_to : :to
    expect(@player.send(field)).send(expectation, be_nil)
  end

  step 'the player :whether_to have a :field of :count' do |whether_to, field, count|
    expectation = whether_to ? :not_to : :to
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

  step 'the player :whether_to have an empty discard pile' do |whether_to|
    expectation = whether_to ? :to : :not_to
    expect(@player.discard_pile).send(expectation, be_empty)
  end

  step 'the player :whether_to have a starter deck of :count cards' do |whether_to, count|
    expectation = whether_to ? :to : :not_to
    expect(@player.deck.size).send(expectation, eq(count))
  end

  step 'the player :whether_to have :count :troop_status troops' do |whether_to, count, troop_status|
    expectation = whether_to ? :to : :not_to
    expect(@player.send(troop_status).size).send(expectation, eq(count))
  end

  step 'the player :whether_to have :count diplomatic progress with :faction' do |whether_to, count, faction|
    expectation = whether_to ? :to : :not_to
    if faction == 'all'
      @player.diplomatic_progress.each do |_, progress|
        expect(progress).send(expectation, eq(count))
      end
    else
      expect(@player.diplomatic_progress[faction]).send(expectation, eq(count))
    end
  end
end
