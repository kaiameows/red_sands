# frozen_string_literal: true

module RedSands
  module Cards
    # CardEvaluator provides a DSL for creating cards
    # it might actually need to just be the card class
    class CardEvaluator
      def self.define(ruleset, name, type, &)
        ruleset.cards[type][name] << new(name).instance_eval(&)
      end

      def cost(resources)
        self.cost = resources
      end

      def play_effect(&); end
      def discard_effect(&); end
    end
  end
end
