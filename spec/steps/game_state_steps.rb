# frozen_string_literal: true

module GameStateSteps
  step 'a standard game is in progress' do
    step 'a standard game with two players'
    @game.start
  end

  step 'a standard game with two players' do
    # so technically there are special rules for two players but we'll ignore that for now
    @game = RedSands::Game.create(players: @players, rules: RedSands::Rules::Standard.new)
  end
end
