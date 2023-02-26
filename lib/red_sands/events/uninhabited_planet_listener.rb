# typed: false
# frozen_string_literal: true

module RedSands
  module Events
    # UninhabitedPlanetEvents contains end-of-turn events for uninhabited planet locations
    class UninhabitedPlanetListener
      include Ma.subscriber

      on(TurnEnd) do |event|
        turn_end_add_gems(event.game_state)
      end

      def turn_end_add_gems(game_state)
        game_state.board.locations.select(&:gem_accumulator?).each do |location|
          location.accumulated_gems += 1
        end
      end
    end
  end
end
