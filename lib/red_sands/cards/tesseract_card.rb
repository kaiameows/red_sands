# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # TesseractCard is associated with all sectors (it allows a worker to move to any sector)
    # TesseractCard does not have a power cost (it is acquired for free)
    # TesseractCard has an action effect: the player draws a card and must discard the TesseractCard from play
    TesseractCard = MarketCard.new(
      name: 'Tesseract',
      power_cost: 0,
      sectors: ['Magic', 'Empire', 'Guild', 'Warrior', 'Uninhabited Sector', 'Inhabited Sector', 'Hall of Heroes'],
      action_effect: -> {
        T.bind(self, RedSands::Rules::EffectEvaluator)
        draw 1
        exile(nil) # idk how this needs to work
      }
    )
  end
end
