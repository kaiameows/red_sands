# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # provides the DSL for defining treasure cards
    class TreasureCardEvaluator < RedSands::Rules::RuleFactory
      extend T::Sig

      sig { returns(T::Array[TreasureCard]) }
      def cards
        @cards ||= T.let(nil, T.nilable(T::Array[TreasureCard]))
        @cards ||= []
      end

      sig do
        params(
          name: String,
          block: T.proc.returns(T.untyped)
        ).returns(
          T::Array[TreasureCard]
        )
      end
      def card(name, &block)
        cards << build(evaluator.tap do |ev|
          ev.name name
          ev.instance_eval(&block)
        end)
      end

      sig { params(evaluator: RedSands::Rules::RuleFactory).returns(TreasureCard) }
      def build(evaluator)
        TreasureCard.new(**evaluator.attributes.slice(:name, :allowed_phases, :effect))
      end

      sig { returns(RedSands::Rules::RuleFactory) }
      def evaluator
        RedSands::Rules::RuleFactory.new
      end
    end
  end
end
