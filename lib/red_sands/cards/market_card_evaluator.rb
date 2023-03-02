# typed: strict
# frozen_string_literal: true

module RedSands
  module Cards
    # Probably there's some more elegant metaprogramming way to do this
    # but sorbet would really prefer that I not
    class MarketCardEvaluator < CardEvaluator
      sig { override.params(evaluator: RedSands::Rules::RuleFactory).returns(MarketCard) }
      def build(evaluator)
        MarketCard.new(**evaluator.attributes)
      end
    end
  end
end
