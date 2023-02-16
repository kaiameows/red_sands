# frozen_string_literal: true

module RedSands
  module Rules
    # provides a DSL for expressing choices
    class OptionEvaluator < RuleFactory
      def do_nothing
        ['Take no action', -> {}]
      end
    end
  end
end
