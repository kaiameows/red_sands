# frozen_string_literal: true

require 'forwardable'

module RedSands
  # deck is a collection of cards
  class BaseDeck < BaseModel
    extend Forwardable
    attr_reader :cards

    def_delegators :@cards, :each, :size, :empty?, :shuffle, :sample, :pop, :push, :<<

    def initialize(cards = [])
      @cards = cards
    end

    def draw(count = 1)
      cards.pop(count)
    end
  end
end
