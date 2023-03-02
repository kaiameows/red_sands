# typed: true
# frozen_string_literal: true

require 'forwardable'

module RedSands
  # deck is a collection of cards
  class BaseDeck < BaseModel
    extend Forwardable
    attr_reader :cards

    def_delegators :@cards, :each, :size, :empty?, :shuffle, :sample, :pop, :push, :<<

    # so instead of having a separate model for hand, main deck, discard pile, etc
    # we really just need to track that at the card level
    def initialize(cards: default_cards)
      @cards = cards
    end

    def default_cards = Cards::StarterCards

    def hand = cards.select(&:hand?)

    def in_play = cards.select(&:play?)

    def discard_pile = cards.select(&:discard?)

    def draw_pile = cards.select(&:deck?)

    def exiled_pile = cards.select(&:exile?)
  end
end
