# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # SecretPowerCard is a card that can be played to gain a secret power
    class SecretPowerCard < T::Struct
      extend T::Sig
      prop :name, String
      prop :allowed_phases, T::Array[Symbol]
      prop :effect, T.proc.void
    end
  end
end
