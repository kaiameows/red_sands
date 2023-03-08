# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # CardEvaluator provides a DSL for creating cards
    # it might actually need to just be the card class
    class CardEvaluator < Rules::RuleFactory
      extend T::Sig

      sig { returns(Deck) }
      def cards
        @cards ||= T.let(nil, T.nilable(Deck))
        @cards ||= []
      end

      sig do
        params(
          name: String,
          count: Integer,
          blk: T.proc.returns(T.untyped)
        ).returns(Deck)
      end
      def card(name, count: 1, &blk)
        cards.push(
          *Array.new(count) do
            build(
              Rules::RuleFactory.new.tap do |evaluator|
                evaluator.name name
                evaluator.instance_eval(&blk)
              end
            )
          end
        )
      end

      sig { params(evaluator: Factory).returns(BaseCard) }
      def build(evaluator)
        BaseCard.new(**evaluator.attributes)
      end

      sig { params(type: String, blk: T.proc.returns(Effect)).returns(Effect) }
      def effect(type, &blk)
        attributes["#{type}_effect".to_sym] = Rules::EffectEvaluator.new.then do |evaluator|
          evaluator.instance_eval(&blk)
        end
      end
    end
  end
end
