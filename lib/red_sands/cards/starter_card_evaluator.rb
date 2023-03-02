# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # StarterCardEvaluator generates the cards for the starter deck
    # it's more or less the same as MarketCard but these cards have no power cost
    class StarterCardEvaluator < CardEvaluator
      extend T::Sig

      sig { override.params(evaluator: RedSands::Rules::RuleFactory).returns(StarterCard) }
      def build(evaluator)
        StarterCard.new(**evaluator.attributes)
      end
    end
  end
end
