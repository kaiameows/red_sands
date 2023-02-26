# typed: true
# frozen_string_literal: true

module RedSands
  # Player needs to be cut down to size a bit
  # so this class should deal with troop-related things for Player
  class Barracks
    attr_accessor :active_troops, :inactive_troops

    def initialize(active_troops: [], inactive_troops: [default_troop] * 2)
      @active_troops = active_troops
      @inactive_troops = inactive_troops
    end

    def default_troop
      RedSands::Troops::NormalTroop
    end
  end
end
