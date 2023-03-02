# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # MotherLode has a buy action which gains the player 1 score
    # MotherLode has a reveal action which gains the player 1 gem
    # MotherLode has a power cost of 9 (it's kinda expensive)
    # Motherlode has no other properties
    MotherLodeCard = MarketCard.new(
      name: 'Mother Lode',
      power_cost: 9,
      buy_effect: -> {
        T.bind(self, RedSands::Rules::EffectEvaluator)
        gain score: 1
      },
      reveal_effect: -> {
        T.bind(self, RedSands::Rules::EffectEvaluator)
        gain gem: 1
      }
    )
  end
end
