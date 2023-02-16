# frozen_string_literal: true

module RedSands
  # Avatars allow players to collect resources from locations on the board
  class Avatar
    attr_reader :player

    def initialize(player)
      @player = player
    end
  end
end
