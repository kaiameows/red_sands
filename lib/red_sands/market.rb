# typed: true
# frozen_string_literal: true

module RedSands
  # The Market is the place where players can buy cards
  # the market has five cards available at any time
  # if any card is purchased, another is drawn to replace it immediately after the draw event is resolved
  class Market < BaseModel
    attr_accessor :decks

    def initialize(decks:)
      @decks = decks
    end

    def available_cards = @available_cards ||= Array.new(5) { decks[:buyable].pop }

    def buy_card(card)
      publish(RedSands::Events::BuyCard, player: GameState.current.player, card:, market: self)
    end
  end
end
