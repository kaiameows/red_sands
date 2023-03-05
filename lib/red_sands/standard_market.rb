# typed: true
# frozen_string_literal: true

module RedSands
  # StandardMarket is the market that is used in the standard game
  class StandardMarket < BaseModel
    attr_accessor :decks

    def initialize(decks: standard_decks)
      super()
      @decks = decks
    end

    def standard_decks
      {
        buyable: RedSands::Cards::StandardBuyableCards,
        secret_power: RedSands::Cards::StandardSecretPowerCards,
        mother_lode: Array.new(10) { RedSands::Cards::MotherLodeCard.dup },
        tesseract: Array.new(6) { RedSands::Cards::TesseractCard.dup },
        warrior: Array.new(8) { RedSands::Cards::SavageWarriorCard.dup },
        tournament: [] # TODO: Add tournament cards
      }
    end

    def buyable_cards = @buyable_cards || Array.new(5) { decks[:buyable].pop }

    def inspect
      "#<StandardMarket: 0x#{object_id.to_s(16)}}>"
    end
  end
end
