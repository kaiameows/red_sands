# typed: false
# frozen_string_literal: true

FactoryBot.define do
  factory :market_card, class: RedSands::Cards::MarketCard do
    name { 'Test Card' }
    power_cost { 1 }
    factions { [RedSands::Faction::Empire] }
    sectors { ['Uninhabited Sector'] }
    buy_effect { nil }

    initialize_with do
      new(
        name:,
        power_cost:,
        factions:,
        sectors:,
        buy_effect:
      )
    end
  end
end
