# typed: false
# frozen_string_literal: true

require 'forwardable'

module RedSands
  module Rules
    # PreconditionEvaluator is similar to EffectEvaluator
    class PreconditionEvaluator
      include Events::Publisher
      extend Forwardable

      def_delegators :@game_state, :player, :opponents, :each_player, :decks

      def game_state = @game_state ||= GameState.current

      def precondition(description, &block)
        Precondition.new(description:, precondition: block)
      end

      def resources(resources)
        description = "#{resources.map { |r| "#{r.count} #{r.type}" }.join(' and ')}."
        precondition(description) do
          player.resources >= resources
        end
      end

      def influence(faction, count)
        description = "#{count} diplomatic progress with the #{faction} faction."
        precondition(description) do
          player.diplomatic_progress[faction] >= count
        end
      end

      def treasures(count)
        description = "has #{count} treasure cards."
        precondition(description) do
          player.treasures.size >= count
        end
      end
    end
  end
end
