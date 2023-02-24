# frozen_string_literal: true

module RedSands
  module Rules
    # LocationEvaluator provides a DSL for creating locations
    class LocationEvaluator < RuleFactory
      def initialize(sector_name)
        super()
        attributes[:sector_name] = sector_name
      end

      def build
        RedSands::Location.new(**attributes.slice(:name, :resources, :cost, :effect, :sector_name)).tap do |loc|
          boolean_attributes.each { |k, v| loc.add_flag(k, v) }
        end
      end
    end
  end
end
