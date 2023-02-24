# frozen_string_literal: true

require 'forwardable'

module RedSands
  module Rules
    # PreconditionEvaluator is similar to EffectEvaluator
    class PreconditionEvaluator
      include Ma.publisher
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

      def secret_powers(count)
        description = "has #{count} secret power cards."
        precondition(description) do
          player.secret_powers.size >= count
        end
      end
    end
  end
end
