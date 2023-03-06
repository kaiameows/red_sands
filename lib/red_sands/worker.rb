# typed: strict
# frozen_string_literal: true

module RedSands
  # Workers allow players to collect resources from locations on the board
  class Worker < BaseModel
    extend T::Sig
    sig { returns(Player) }
    attr_reader :player

    sig { returns(T.nilable(Location)) }
    attr_accessor :location

    sig { params(player: Player, location: T.nilable(Location)).void }
    def initialize(player, location: nil)
      @player = player
      @location = location
    end
  end
end
