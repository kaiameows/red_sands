# frozen_string_literal: true

module RedSands
  # StandardMarket is the market that is used in the standard game
  class StandardMarket < BaseModel
    def initialize(decks: standard_decks)
      super()
      @decks = decks
    end

    def standard_decks
      {
        buyable: RedSands::Cards::StandardBuyableCards,
        secret_power: RedSands::Cards::StandardSecretPowerCards,
        mother_lode: Array.new(10) { RedSands::Cards::MotherLodeCard.new },
        tesseract: Array.new(6) { RedSands::Cards::TesseractCard.new },
        warrior: Array.new(8) { RedSands::Cards::SavageWarriorCard.new },
      }
    end
  end
end