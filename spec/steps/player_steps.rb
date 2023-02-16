# frozen_string_literal: true

module PlayerSteps
  step "two players are in the game" do
    @players = [RedSands::Player.new, RedSands::Player.new]
  end
end