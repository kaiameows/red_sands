# typed: true
# frozen_string_literal: true

module RedSands
  module Rules
    # provides a DSL for expressing choices
    class ChoiceEvaluator
      def options = @options ||= {}

      def option(name, &)
        options[name] = OptionEvaluator.new.tap do |evaluator|
          evaluator.instance_eval(&)
        end.attributes
      end
    end
  end
end
