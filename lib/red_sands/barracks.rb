# typed: strict
# frozen_string_literal: true

module RedSands
  # Player needs to be cut down to size a bit
  # so this class should deal with troop-related things for Player
  class Barracks
    Unit = T.type_alias { T::Array[Troops::BaseTroop] }
    extend T::Sig

    sig { returns(Unit) }
    attr_reader :troops

    sig { params(troops: Unit).void }
    def initialize(troops: default_troops)
      @troops = troops
    end

    sig { returns(Unit) }
    def default_troops
      Array.new(3) { default_troop.tap(&:reserve!) }
    end

    sig { returns(Unit) }
    def active_troops = troops.select(&:active?)

    sig { returns(Unit) }
    def reserve_troops = troops.select(&:inactive?)

    private

    sig { returns(Troops::NormalTroop) }
    def default_troop
      Troops::NormalTroop.new
    end
  end
end
