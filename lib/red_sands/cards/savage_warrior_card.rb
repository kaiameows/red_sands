# frozen_string_literal: true

module RedSands
  module Cards
    class SavageWarriorCard < RedSands::Cards::BaseCard
      def initialize
        super(
          name: 'Savage Warrior',
          power_cost: 2,
          faction: 'Warrior',
          sectors: ['Uninhabited Sector', 'Inhabited Sector']
        )
      end
    end
  end
end
