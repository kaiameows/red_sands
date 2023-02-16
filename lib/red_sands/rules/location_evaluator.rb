# frozen_string_literal: true

module RedSands
  module Rules
    # LocationEvaluator provides a DSL for creating locations
    class LocationEvaluator < RuleFactory
      def build
        RedSands::Location.new(**attributes.slice(:name, :cost, :resources, :effect)).tap do |loc|
          boolean_attributes.each { |k, v| loc.add_flag(k, v) }
        end
      end
    end
  end
end
