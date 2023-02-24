# frozen_string_literal: true

module RedSands
  # StandardMarket is the market that is used in the standard game
  class StandardMarket < BaseModel
    attr_accessor :decks

    def initialize(decks: standard_decks)
      super
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
