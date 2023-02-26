# typed: false
# frozen_string_literal: true

module RedSands
  module Cards
    # StandardCard is the base class for all standard cards
    class StandardCard < BaseCard
      # cards include a state machine that tracks whether they are in the player's hand, play area, discard pile, or draw pile
    end
  end
end
