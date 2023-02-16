# frozen_string_literal: true

module GameSteps
  step "a standard game is in progress" do
    step "two players are in the game"
    # so technically there are special rules for two players but we'll ignore that for now
    @game = RedSands::Game.create(players: @players, rules: RedSands::Rules::Standard.new)
  end
end
