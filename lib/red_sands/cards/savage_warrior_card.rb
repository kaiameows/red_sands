# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # always buyable card
    SavageWarriorCard = MarketCard.new(
      name: 'Savage Warrior',
      power_cost: 2,
      factions: [Faction::Warrior],
      sectors: ['Uninhabited Sector', 'Inhabited Sector']
    )
  end
end
