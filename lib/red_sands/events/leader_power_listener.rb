# typed: false
# frozen_string_literal: true

module RedSands
  module Events
    # LeaderPower is an event that is triggered when a leader power is used
    class LeaderPowerListener < RedSands::Events::BaseListener
      # on(LeaderPower) do |event|
      #   precondition, effect, cost = event.attributes.values_at(:precondition, :effect, :cost)
      #   check_precondition(precondition) if precondition
      #   broadcast(RedSands::Events::PlayerSpendResources.new(cost:))
      #   game_state.instance_eval(&effect)
      # end
    end
  end
end
