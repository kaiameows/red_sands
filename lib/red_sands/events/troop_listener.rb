# frozen_string_literal: true

module RedSands
  module Events
    class TroopListener
      include Ma.subscriber

      on(TurnEnd) do |event|
        turn_end_active_troops(event.game_state)
      end

      def turn_end_active_troops(game_state)
        game_state.each_player do |player|
          player.reserve_troops.push += player.active_troops.delete_if(&:destructible?)
          player.active_troops.clear
        end
      end
    end
  end
end
