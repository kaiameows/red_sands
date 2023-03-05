# typed: false
# frozen_string_literal: true

module RedSands
  module Events
    # cleans up dead troops after a tournament
    class TroopListener < RedSands::Events::BaseListener
      def on_tournament_end(players:)
        players.each do |player|
          player.reserve_troops.push += player.active_troops.delete_if(&:destructible?)
          player.active_troops.clear
        end
      end
    end
  end
end
