# typed: true
# frozen_string_literal: true

module RedSands
  module Rules
    # LeaderEvaluator provides a DSL for creating leaders
    class LeaderEvaluator < RuleFactory
      def active_power(text, &)
        attributes[:active_power] = LeaderPowerEvaluator.new.tap do |evaluator|
          evaluator.description text
          evaluator.instance_eval(&)
        end.build
      end

      def passive_power(description, &block)
        attributes[:passive_power_description] = description
        attributes[:passive_power] = block
      end

      def build
        RedSands::Leader.new(**attributes.slice(:name, :active_power, :passive_power_description)).tap do |leader|
          boolean_attributes.each { |k, v| leader.add_flag(k, v) }
          leader.singleton_class.class_eval(&attributes[:passive_power])
        end
      end
    end
  end
end
