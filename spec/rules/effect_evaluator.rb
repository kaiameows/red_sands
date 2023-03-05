# typed: true
# frozen_string_literal: true

require 'forwardable'

module RedSands
  module Rules
    # EffectEvaluator evaluates the effects of an action
    # I guess it needs to be evaluated at declaration time
    # I dun waaaannaaaaa
    class EffectEvaluator
      include RedSands::Events::Publisher
      extend Forwardable
      extend T::Sig

      def_delegators :@game_state, :player, :opponents, :each_player, :decks

      def game_state = @game_state ||= RedSands::GameState.current

      sig { params(description: String, block: T.proc.returns(T.untyped)).returns(Effect) }
      def effect(description, &block)
        Effect.new(description:, effect: block)
      end

      sig { params(resources: T::Hash[Symbol, Integer]).returns(Effect) }
      def gain(resources)
        description = "Gain #{resources.map { |k, v| "#{k} #{v}" }.join(' and ')}."
        effect(description) do
          publish(RedSands::Events::GainResources, player:, resources: Resources.new(resources))
        end
      end

      sig { params(count: Integer).returns(Effect) }
      def draw(count)
        description = "Draw #{count} cards."
        effect(description) do
          publish(RedSands::Events::DrawCard, player:, decks:, count:)
        end
      end

      sig { params(count: Integer).returns(Effect) }
      def discard(count)
        description = "Discard #{count} cards."
        effect(description) do
          publish(RedSands::Events::DiscardCard, player:, decks:, count:)
        end
      end

      sig { params(faction: Faction, count: Integer).returns(Effect) }
      def gain_influence_with_faction(faction, count)
        description = "Gain #{count} influence with the #{faction} faction."
        effect(description) do
          publish(RedSands::Events::GainInfluence, player:, faction:, count:)
        end
      end

      sig { params(count: Integer).returns(Effect) }
      def gain_treasures(count)
        description = "Gain #{count} treasure cards."
        effect(description) do
          publish(RedSands::Events::GainTreasure, player:, count:)
        end
      end

      sig { params(description: String, blk: T.proc.void).returns(Effect) }
      def choice(description, &blk)
        effect(description) do
          ChoiceEvaluator.new(description:).tap do |ev|
            ev.instance_eval(&blk).run
          end
        end
      end

      sig { params(card: T.untyped).returns(Effect) }
      def exile(card)
        description = "Exile #{card.name}."
        effect(description) do
          publish(RedSands::Events::ExileCard, player:, card:)
        end
      end
    end
  end
end
