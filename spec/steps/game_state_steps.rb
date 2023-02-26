# typed: false
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

  step 'the :deck_type deck should be initialized' do |deck_type|
    expect(@game.decks[deck_type]).not_to be_nil
  end

  step 'the permanent buyable card decks should be initialized' do
    ['mother lode', 'tesseract', 'warrior'].each do |deck_type|
      step "the #{deck_type} deck should be initialized"
    end
  end

  step 'the market should be initialized' do
    expect(@game.market).not_to be_nil
  end
end
