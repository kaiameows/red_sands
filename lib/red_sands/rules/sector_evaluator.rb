# frozen_string_literal: true

module RedSands
  module Rules
    # SectorEvaluator provides a DSL for creating sectors
    class SectorEvaluator < RuleFactory
      def locations = @locations ||= {}

      def location(name, &)
        r = LocationEvaluator.new
        r.instance_eval(&)
        locations[name] = r.attributes
      end
    end
  end
end
