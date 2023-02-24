# frozen_string_literal: true

module RedSands
  module Cards
    # TesseractCard is associated with all sectors (it allows a worker to move to any sector)
    # TesseractCard does not have a power cost (it is acquired for free)
    # TesseractCard has an action effect: the player draws a card and must discard the TesseractCard from play
    class TesseractCard < BaseCard
      def initialize
        this_card = self
        super(
          name: 'Tesseract',
          sectors: ['Magic', 'Empire', 'Guild', 'Warrior', 'Uninhabited Sector', 'Inhabited Sector', 'Hall of Heroes'],
          action_effect: -> (_) {
            draw 1
            exile this_card
          }
        )
      end
    end
  end
end
