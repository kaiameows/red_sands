# frozen_string_literal: true

module RedSands
  module Rules
    # LeaderEvaluator provides a DSL for creating leaders
    class LeaderCollectionEvaluator < RuleFactory
      def leaders = @leaders ||= []

      def leader(name, &)
        leaders << LeaderEvaluator.new.tap do |evaluator|
          evaluator.instance_eval(&)
          evaluator.name name
        end.build
      end

      alias build leaders
    end
  end
end
