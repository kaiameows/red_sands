# frozen_string_literal: true

module RedSands
  module Rules
    # PowerEvaluator provides a DSL for creating powers
    # it probably just needs to inherit from RuleFactory
    class LeaderPowerEvaluator < RuleFactory
      def build
        RedSands::LeaderPower.new(**attributes.slice(:description, :cost, :effect))
      end
    end
  end
end
