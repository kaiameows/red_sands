# typed: false
# frozen_string_literal: true

module RedSands
  module Cards
    # MotherLode has a buy action which gains the player 1 score
    # MotherLode has a reveal action which gains the player 1 gem
    # MotherLode has a power cost of 9 (it's kinda expensive)
    # Motherlode has no other properties
    class MotherLodeCard < BaseCard
      def initialize
        super(
          name: 'Mother Lode',
          power_cost: 9,
          buy_effect: -> { gain score: 1 },
          reveal_effect: -> { gain gem: 1 }
        )
      end
    end
  end
end
