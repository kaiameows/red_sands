# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # TournamentCards are rewards for winning tournaments
    # they often have choices and cannot be simply modeled as a gain of resources
    # Tournament cards always have three prizes, for first place, second place, and third place respectively
    # probably the actual award will need to be handled in a listener
    # but it's worth noting here that the third-place prize is only awarded if there are at least 4 players
    # and in the event of a tie, the tied players each receive the next worse prize
    # so two people tied for first place would each receive the second-place prize
    class TournamentCard < BaseModel
      extend T::Sig

      sig { returns(T::Array[Effect]) }
      attr_reader :prizes

      sig { params(prizes: T::Array[Effect]).void }
      def initialize(prizes:)
        @prizes = prizes
      end

      sig { params(prizes: T::Array[Effect]).returns(TournamentCard) }
      def self.from_array(prizes)
        new(prizes:)
      end
    end
  end
end
