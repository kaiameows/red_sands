# typed: false
# frozen_string_literal: true

FactoryBot.define do
  factory :game_state, class: RedSands::GameState do
    transient { player_count { 2 } }

    initialize_with do
      players = FactoryBot.build_list(:player, player_count)
      new(players:)
    end
  end
end

