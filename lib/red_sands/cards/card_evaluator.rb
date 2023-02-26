# typed: false
# frozen_string_literal: true

module RedSands
  module Cards
    # CardEvaluator provides a DSL for creating cards
    # it might actually need to just be the card class
    class CardEvaluator < RedSands::Rules::RuleFactory
      def cards = @cards ||= []

      def card(name, count: 1, &)
        cards.push(*[RedSands::Rules::RuleFactory.new.tap do |evaluator|
          evaluator.name name
          evaluator.instance_eval(&)
        end] * count)
      end

      def build
        klass = RedSands::Cards::StandardCard
        cards.map do |card|
          klass.new(**card.attributes.slice(*klass.members)).tap do |c|
            boolean_attributes.each { |k, v| c.add_flag(k, v) }
          end
        end
      end
    end
  end
end
