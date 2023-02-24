# frozen_string_literal: true

module RedSands
  # Workers allow players to collect resources from locations on the board
  class Worker < BaseModel
    attr_reader :player

    def initialize(player)
      @player = player
    end
  end
end
