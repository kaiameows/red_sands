# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # Tournament Cards all have the same structure: a first-place prize, second-place prize, and third-place prize
    class TournamentCardEvaluator < Rules::RuleFactory
      extend T::Sig
      EffectArray = T.type_alias { T::Array[Effect] }

      sig { returns(EffectArray) }
      def effects
        @effects ||= T.let(nil, T.nilable(T::Array[Effect]))
        @effects ||= []
      end

      sig do
        params(
          block: T.proc.returns(Effect)
        ).returns(EffectArray)
      end
      def effect(&block)
        effects << Rules::EffectEvaluator.new.instance_eval(&block)
      end

      sig { params(block: T.proc.void).returns(TournamentCard) }
      def card(&block)
        new.tap do |evaluator|
          evaluator.instance_eval(&block)
        end.build
      end

      sig { returns(TournamentCard) }
      def build
        TournamentCard.from_array(Array.new(3) { effects.shift })
      end
    end
  end
end
