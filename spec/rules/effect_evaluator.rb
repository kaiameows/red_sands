# typed: false
# frozen_string_literal: true

require 'forwardable'

module RedSands
  module Rules
    # EffectEvaluator evaluates the effects of an action
    # I guess it needs to be evaluated at declaration time
    # I dun waaaannaaaaa
    class EffectEvaluator
      include Ma::Publisher
      include RedSands::Events::Publisher
      extend Forwardable

      def_delegators :@game_state, :player, :opponents, :each_player, :decks

      def game_state = @game_state ||= RedSands::GameState.current

      def effect(description, &block)
        Effect.new(description:, effect: block)
      end

      def gain(resources)
        description = "Gain #{resources.map { |r| "#{r.count} #{r.type}" }.join(' and ')}."
        effect(description) do
          publish(RedSands::Events::GainResources, player:, resources:)
        end
      end

      def draw(count)
        description = "Draw #{count} cards."
        effect(description) do
          publish(RedSands::Events::DrawCard, player:, decks:, count:)
        end
      end

      def discard(count)
        description = "Discard #{count} cards."
        effect(description) do
          publish(RedSands::Events::DiscardCard, player:, decks:, count:)
        end
      end

      def gain_influence_with_faction(faction, count)
        description = "Gain #{count} influence with the #{faction} faction."
        effect(description) do
          publish(RedSands::Events::GainInfluence, player:, faction:, count:)
        end
      end

      def gain_secret_powers(count)
        description = "Gain #{count} secret power cards."
        effect(description) do
          publish(RedSands::Events::GainSecretPower, player:, count:)
        end
      end

      def choice(description, &)
        effect(description) do
          ChoiceEvaluator.new(description:).tap.instance_eval(&).run
        end
      end

      def exile(card)
        description = "Exile #{card.name}."
        effect(description) do
          broadcast(RedSands::Events::ExileCard, player:, card:)
        end
      end
    end
  end
end
