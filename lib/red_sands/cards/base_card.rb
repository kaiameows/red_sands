# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    Factory = T.type_alias { Rules::RuleFactory }
    Deck = T.type_alias { T::Array[BaseCard] }
    # BaseCard is the base class for all cards in the game
    class BaseCard < BaseModel
      extend T::Sig

      sig { returns(String) }
      attr_reader :name

      sig { params(name: String).void }
      def initialize(name: '')
        @name = name
      end
    end
  end
end
