# frozen_string_literal: true

module RedSands
  module Rules
    # RuleEvaluator provides a DSL for defining rules
    class RuleSet
      def self.rulesets
        @rulesets ||= {}
      end

      def self.[](name)
        rulesets[name]
      end

      def self.define(name, &)
        rulesets[name] = new.instance_eval(&)
      end

      attr_reader :name

      def standard_cards
        {}
      end

      def board(name, &)
        @board ||= Board.new(name).instance_eval(&)
      end
    end
  end
end
