# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # TreasureCard is a card that can be played to gain a treasure
    class TreasureCard < T::Struct
      extend T::Sig
      prop :name, String
      prop :allowed_phases, T::Array[Symbol]
      prop :effect, T.proc.void
    end
  end
end
