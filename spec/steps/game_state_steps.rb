# frozen_string_literal: true

module GameStateSteps
  step 'a standard game is in progress' do
    step 'a standard game with 2 players'
    # @game.start
  end

  step 'a standard game with :count players' do |count|
    @players = build_list(:player, count.to_i)
    @game = RedSands::GameState.new(players: @players, ruleset: RedSands::Rules::StandardRules.new)
  end

  step 'each player :should_have :count :resource' do |should_have, count, resource|
    expectation = should_have ? :to : :not_to
    @players.each do |player|
      expect(player.send(resource)).send(expectation, eq(count.to_i))
    end
  end

  step 'each player :should_have a :attribute' do |should_have, attribute|
    expectation = should_have ? :to : :not_to
    @players.each do |player|
      expect(player.send(attribute)).send(expectation, be_a(String))
    end
  end
end
