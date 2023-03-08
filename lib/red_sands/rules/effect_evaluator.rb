# typed: true
# frozen_string_literal: true

require 'forwardable'

module RedSands
  module Rules
    # EffectEvaluator evaluates the effects of an action
    # I guess it needs to be evaluated at declaration time
    # I dun waaaannaaaaa
    class EffectEvaluator
      include Events::Publisher
      extend Forwardable
      extend T::Sig

      def_delegators :@game_state, :player, :opponents, :each_player, :decks

      def game_state = @game_state ||= GameState.current

      # So the following two methods probably need a word of explanation
      # building an effect requires that the cost and precondition be set at initialization
      # so a stateless implementation of those effects (i.e. one that doesn't need to set an instance variable)
      # would need those two things to be passed in as arguments, which would make our DSL ugly
      # but when we evaluate the block that defines the effect, we only get a single value returned
      # and that needs to be the actual effect (because EffectEvaluator is written to return an Effect)
      # the solution to this is to keep track of whether the methods `cost` and `precondition` have been called
      # ergo: instance variables and destructive getters
      sig { returns(Resources) }
      # rubocop:disable Naming/AccessorMethodName
      def get_cost!
        return Resources.none if @cost.nil?

        cost = @cost
        @cost = nil
        cost
      end

      sig { returns(T.nilable(T.proc.returns(T::Boolean))) }
      def get_precondition!
        return nil if @precondition.nil?

        precondition = @precondition
        @precondition = nil
        precondition
      end
      # rubocop:enable Naming/AccessorMethodName

      sig { params(resources: T::Hash[Symbol, Integer]).void }
      def cost(resources)
        @cost = Resources.new(resources)
      end

      sig { params(block: T.proc.returns(T::Boolean)).void }
      def precondition(&block)
        @precondition = block
      end

      sig do
        params(
          description: String,
          block: T.proc.returns(T.untyped)
        ).returns(Effect)
      end
      def effect(description, &block)
        cost = get_cost!
        precondition = get_precondition!
        Effect.new(description:, precondition:, cost:, effect: block)
      end

      sig { params(resources: T::Hash[Symbol, Integer]).returns(Effect) }
      def gain(resources)
        description = "Gain #{resources.map { |k, v| "#{k} #{v}" }.join(' and ')}."
        raw_resources = Resources.new(**resources.slice(:food, :gems, :money, :score))
        effect(description) do
          publish(:gain_treasure, player:, count: resources[:treasure]) if resources[:treasure]
          publish(:gain_troops, player:, count: resources[:troops]) if resources[:troops]
          publish(:gain_resources, player:, resources: raw_resources)
        end
      end

      sig { params(count: Integer).returns(Effect) }
      def draw(count)
        description = "Draw #{count} cards."
        effect(description) do
          publish(:draw, player:, count:)
        end
      end

      sig { params(count: Integer).returns(Effect) }
      def discard(count)
        description = "Discard #{count} cards."
        effect(description) do
          publish(:discard, player:, count:)
        end
      end

      sig { params(faction: Faction, count: Integer).returns(Effect) }
      def gain_influence_with_faction(faction, count)
        description = "Gain #{count} influence with the #{faction} faction."
        effect(description) do
          publish(:change_influence, player:, faction:, count:)
        end
      end

      sig { params(count: Integer).returns(Effect) }
      def gain_treasures(count)
        description = "Gain #{count} treasure cards."
        effect(description) do
          publish(:gain_treasure, player:, count:)
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
          publish(:exile, player:, card:)
        end
      end

      def high_council_seat
        description = 'Gain a high council seat.'
        effect(description) do
          publish(:gain_council_seat, player:)
        end
      end
    end
  end
end
